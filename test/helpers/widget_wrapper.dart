import 'package:flutter/material.dart';
import 'package:pandoo/l10n/app_localizations.dart';

Widget wrapWithMaterialApp(Widget widget) {
  return MaterialApp(
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Material(child: widget),
  );
}
