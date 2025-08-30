import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 2)
class Settings extends HiveObject {
  @HiveField(0)
  Locale? locale;

  @HiveField(1)
  ThemeMode theme;

  Settings({
    this.locale,
    this.theme = ThemeMode.system,
  });
}
