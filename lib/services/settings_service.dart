import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/settings_model.dart';

class SettingsService {
  static const String _boxName = 'settings_db';
  static const String _settingsKey = 'app_settings';

  static final SettingsService _instance = SettingsService._internal();
  factory SettingsService() => _instance;
  SettingsService._internal();

  late Box<Settings> _box;

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(SettingsAdapter());
    }
    _box = await Hive.openBox<Settings>(_boxName);

    // Initialize with default settings if empty
    if (_box.isEmpty) {
      await _box.put(_settingsKey, Settings());
    }
  }

  Settings get _settings => _box.get(_settingsKey) ?? Settings();

  ThemeMode getThemeMode() {
    return _settings.theme;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _box.put(
        _settingsKey,
        Settings(
          languageCode: _settings.languageCode,
          themeMode: mode.toString(),
        ));
  }

  Locale? getLocale() {
    return _settings.locale;
  }

  Future<void> setLocale(Locale? locale) async {
    await _box.put(
        _settingsKey,
        Settings(
          languageCode: locale?.languageCode,
          themeMode: _settings.themeMode,
        ));
  }
}
