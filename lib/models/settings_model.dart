import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings_model.g.dart';

@HiveType(typeId: 2)
class Settings {

  Settings({
    this.locale,
    this.theme = ThemeMode.system,
    this.analyticsEnabled = false,
    this.fabAnimation = true,
  });
  @HiveField(0)
  final Locale? locale;

  @HiveField(1)
  ThemeMode theme;

  @HiveField(2)
  bool analyticsEnabled;

  @HiveField(3)
  bool fabAnimation;

  Settings copyWith({
    Locale? locale,
    bool clearLocale = false,
    ThemeMode? theme,
    bool? analyticsEnabled,
    bool? fabAnimation,
  }) {
    return Settings(
      locale: clearLocale ? null : locale ?? this.locale,
      theme: theme ?? this.theme,
      analyticsEnabled: analyticsEnabled ?? this.analyticsEnabled,
      fabAnimation: fabAnimation ?? this.fabAnimation,
    );
  }
}
