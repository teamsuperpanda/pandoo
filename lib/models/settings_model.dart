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
  Locale? locale;

  @HiveField(1)
  ThemeMode theme;

  @HiveField(2)
  bool analyticsEnabled;

  @HiveField(3)
  bool fabAnimation;

  Settings copyWith({
    Locale? Function()? locale,
    ThemeMode Function()? theme,
    bool Function()? analyticsEnabled,
    bool Function()? fabAnimation,
  }) {
    return Settings(
      locale: locale != null ? locale() : this.locale,
      theme: theme != null ? theme() : this.theme,
      analyticsEnabled: analyticsEnabled != null ? analyticsEnabled() : this.analyticsEnabled,
      fabAnimation: fabAnimation != null ? fabAnimation() : this.fabAnimation,
    );
  }
}
