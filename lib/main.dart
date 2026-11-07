import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/core/startup.dart';
import 'package:pandoo/core/theme/app_theme.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/screens/home_screen.dart';
import 'package:pandoo/screens/startup_error_screen.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/services/storage_service.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  String? startupError;
  try {
    startupError = await runStartup(
      storageInit: StorageService().init,
      settingsInit: SettingsService().init,
    );
  } finally {
    FlutterNativeSplash.remove();
  }

  if (startupError == null) {
    runApp(const MyApp());
  } else {
    runApp(StartupErrorApp(diagnostics: startupError));
  }
}

Future<String?> _retryStartup() async {
  final error = await runStartup(
    storageInit: StorageService().init,
    settingsInit: SettingsService().init,
  );
  if (error == null) runApp(const MyApp());
  return error;
}

Future<void> _resetLocalData() async {
  try {
    await StorageService().close();
  } on Object catch (_) {}
  try {
    await Hive.deleteBoxFromDisk(StorageService.listsBoxName);
  } on Object catch (_) {}
  try {
    await Hive.deleteBoxFromDisk(SettingsService.boxName);
  } on Object catch (_) {}
  await runStartup(
    storageInit: StorageService().init,
    settingsInit: SettingsService().init,
  );
  runApp(const MyApp());
}

class StartupErrorApp extends StatelessWidget {
  const StartupErrorApp({required this.diagnostics, super.key});

  final String diagnostics;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pandoo',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: StartupErrorScreen(
        diagnostics: diagnostics,
        onRetry: _retryStartup,
        onReset: _resetLocalData,
      ),
    );
  }
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
