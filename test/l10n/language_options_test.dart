import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/l10n/language_options.dart';

void main() {
  test('offers regional variants for languages that have them', () {
    expect(languageOptions.keys, containsAll(['pt', 'pt-BR', 'pt-PT']));
    expect(languageOptions.keys, containsAll(['en', 'en-GB', 'en-AU']));
    expect(languageOptions.keys, containsAll(['fr', 'fr-CA', 'fr-FR']));
    expect(languageOptions.keys, containsAll(['es', 'es-419']));
    expect(
      languageOptions.keys,
      containsAll(['zh', 'zh-CN', 'zh-HK', 'zh-TW']),
    );
  });

  test('parses regional tags into a locale', () {
    expect(localeFromTag('pt-BR'), const Locale('pt', 'BR'));
    expect(localeFromTag('zh-TW'), const Locale('zh', 'TW'));
    expect(localeFromTag('de'), const Locale('de'));
  });

  test('round-trips a locale back to a tag', () {
    expect(tagFromLocale(const Locale('pt', 'BR')), 'pt-BR');
    expect(tagFromLocale(const Locale('de')), 'de');
  });
}
