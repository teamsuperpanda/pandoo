import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:pandoo/screens/about_screen.dart';

void main() {
  testWidgets('shows version, privacy statement, licenses and source', (
    tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: AboutScreen(versionOverride: '2.5.0 (14)'),
      ),
    );

    expect(find.text('Version 2.5.0 (14)'), findsOneWidget);
    expect(find.text('Built by Team Super Panda'), findsOneWidget);
    expect(find.textContaining('never leaves the device'), findsOneWidget);
    expect(find.text('Third-party licenses'), findsOneWidget);
    expect(find.text('MIT License'), findsWidgets);
    expect(find.text(AboutScreen.sourceUrl), findsOneWidget);
  });

  testWidgets('opens the license page', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('en'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: AboutScreen(versionOverride: '2.5.0 (14)'),
      ),
    );

    await tester.tap(find.text('Third-party licenses'));
    await tester.pumpAndSettle();

    expect(find.byType(LicensePage), findsOneWidget);
  });
}
