import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 2)
class Settings extends HiveObject {
  @HiveField(0)
  final String? languageCode;

  @HiveField(1)
  final String themeMode;

  Settings({
    this.languageCode,
    this.themeMode = 'system',
  });

  ThemeMode get theme => ThemeMode.values.firstWhere(
        (mode) => mode.toString() == themeMode,
        orElse: () => ThemeMode.system,
      );

  Locale? get locale => languageCode != null ? Locale(languageCode!) : null;
}
