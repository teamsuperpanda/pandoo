import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pandoo/core/theme/app_theme.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/screens/home_screen.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/services/storage_service.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  try {
    await StorageService().init();
    await SettingsService().init();
  } finally {
    FlutterNativeSplash.remove();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ThemeData _lightTheme = AppTheme.light();
  static final ThemeData _darkTheme = AppTheme.dark();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Settings>(
      valueListenable: SettingsService().notifier,
      builder: (context, settings, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pandoo',
        theme: _lightTheme,
        darkTheme: _darkTheme,
        themeMode: settings.theme,
        locale: settings.locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const HomeScreen(),
      ),
    );
  }
}
