import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/locale_adapter.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/models/theme_mode_adapter.dart';

class SettingsService {
  factory SettingsService() => _instance;
  SettingsService._internal();
  static const String _boxName = 'settings_db';
  static const String _settingsKey = 'app_settings';

  static SettingsService _instance = SettingsService._internal();

  late Box<Settings> _box;
  Settings? _cached;
  Future<void> _mutationQueue = Future<void>.value();
  final ValueNotifier<Settings> notifier = ValueNotifier<Settings>(Settings());

  Future<void> init() async {
    try {
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

      if (_box.isEmpty) {
        await _box.put(_settingsKey, Settings());
      }
      _cached = _box.get(_settingsKey) ?? Settings();
      notifier.value = _cached!;
    } on Object catch (e) {
      debugPrint('SettingsService init error: $e');
      rethrow;
    }
  }

  Settings get _settings => _cached ??= _box.get(_settingsKey) ?? Settings();

  ThemeMode getThemeMode() {
    return _settings.theme;
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    await _mutateSettings(
      'setThemeMode',
      (settings) => settings.copyWith(theme: mode),
    );
  }

  Locale? getLocale() {
    return _settings.locale;
  }

  Future<void> setLocale(Locale? locale) async {
    await _mutateSettings(
      'setLocale',
      (settings) => settings.copyWith(
        locale: locale,
        clearLocale: locale == null,
      ),
    );
  }

  bool getFabAnimation() {
    return _settings.fabAnimation;
  }

  Future<void> setFabAnimation(bool value) async {
    await _mutateSettings(
      'setFabAnimation',
      (settings) => settings.copyWith(fabAnimation: value),
    );
  }

  Future<void> _mutateSettings(
    String operationName,
    Settings Function(Settings settings) update,
  ) {
    final operation = _mutationQueue.then((_) async {
      try {
        final newSettings = update(_settings);
        await _box.put(_settingsKey, newSettings);
        _cached = newSettings;
        notifier.value = newSettings;
      } on Object catch (error) {
        debugPrint('SettingsService $operationName error: $error');
        rethrow;
      }
    });

    _mutationQueue = operation.then<void>(
      (_) {},
      onError: (Object _, StackTrace _) {},
    );
    return operation;
  }

  @visibleForTesting
  static void setTestInstance(Box<Settings> box) {
    _instance = SettingsService._internal();
    _instance._box = box;
  }
}
