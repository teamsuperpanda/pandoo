import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/locale_adapter.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/models/theme_mode_adapter.dart';

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
    if (!Hive.isAdapterRegistered(100)) {
      Hive.registerAdapter(ThemeModeAdapter());
    }
    if (!Hive.isAdapterRegistered(101)) {
      Hive.registerAdapter(LocaleAdapter());
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
    final newSettings = _settings..theme = mode;
    await _box.put(_settingsKey, newSettings);
  }

  Locale? getLocale() {
    return _settings.locale;
  }

  Future<void> setLocale(Locale? locale) async {
    final newSettings = _settings..locale = locale;
    await _box.put(_settingsKey, newSettings);
  }
}
