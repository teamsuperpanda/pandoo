import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:pandoo/l10n/locale_resolution.dart';

void main() {
  const supported = AppLocalizations.supportedLocales;

  test('unsupported system locale falls back to English, not Afrikaans', () {
    expect(
      resolveAppLocale(const [Locale('xx')], supported),
      const Locale('en'),
    );
    expect(resolveAppLocale(null, supported), const Locale('en'));
    expect(resolveAppLocale(const [], supported), const Locale('en'));
  });

  test('exact regional match wins', () {
    expect(
      resolveAppLocale(const [Locale('pt', 'BR'), Locale('en')], supported),
      const Locale('pt', 'BR'),
    );
  });

  test('falls back to the same language when the region is unavailable', () {
    expect(
      resolveAppLocale(const [Locale('de', 'XX')], supported),
      const Locale('de'),
    );
  });

  test('follows the system preference list', () {
    expect(
      resolveAppLocale(const [Locale('xx'), Locale('fr', 'FR')], supported),
      const Locale('fr', 'FR'),
    );
  });
}
