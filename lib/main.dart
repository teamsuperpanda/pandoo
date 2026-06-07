import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/core/config.dart';
import 'package:pandoo/core/theme/app_theme.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:pandoo/screens/home_screen.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    await Hive.initFlutter();
    await StorageService().init();
    await SettingsService().init();
  } finally {
    FlutterNativeSplash.remove();
  }

  runApp(
    MyApp(
      umamiService: UmamiService(
        websiteId: AppConfig.analyticsWebsiteId,
        endpoint: AppConfig.analyticsEndpoint,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    required this.umamiService,
    super.key,
  });

  final UmamiService umamiService;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale;
  final _settings = SettingsService();
  bool _isInitialized = false;
  late final ThemeData _lightTheme = AppTheme.light();
  late final ThemeData _darkTheme = AppTheme.dark();

  @override
  void initState() {
    super.initState();
    widget.umamiService.trackEvent(eventName: 'app_launch');
    unawaited(_initializeApp());
  }

  @override
  void dispose() {
    widget.umamiService.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    try {
      _themeMode = _settings.getThemeMode();
      _locale = _settings.getLocale();
      widget.umamiService.enabled = _settings.getAnalyticsEnabled();

      setState(() {
        _isInitialized = true;
      });
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<void> _handleThemeChange(ThemeMode themeMode) async {
    await _settings.setThemeMode(themeMode);
    setState(() {
      _themeMode = themeMode;
    });
  }

  Future<void> _handleLanguageChange(Locale? locale) async {
    await _settings.setLocale(locale);
    setState(() {
      _locale = locale;
    });
  }

  Future<void> _handleAnalyticsChanged(bool enabled) async {
    await _settings.setAnalyticsEnabled(enabled);
    widget.umamiService.enabled = enabled;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: _lightTheme,
        darkTheme: _darkTheme,
        themeMode: _themeMode,
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandoo',
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _themeMode,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [UmamiNavigatorObserver(widget.umamiService)],
      home: HomeScreen(
        onThemeChanged: _handleThemeChange,
        currentThemeMode: _themeMode,
        onLanguageChanged: _handleLanguageChange,
        currentLocale: _locale,
        umamiService: widget.umamiService,
        onAnalyticsChanged: _handleAnalyticsChanged,
      ),
    );
  }
}
