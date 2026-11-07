import 'dart:ui';

/// Resolves the app locale from the system list.
///
/// The generated [supportedLocales] list is alphabetical, so the old default
/// (the first supported locale) was Afrikaans. This picks an exact match first,
/// then a language match, and finally English.
Locale resolveAppLocale(
  List<Locale>? preferredLocales,
  Iterable<Locale> supportedLocales,
) {
  final supported = supportedLocales.toList();
  final english = supported.firstWhere(
    (locale) => locale.languageCode == 'en',
    orElse: () => supported.isEmpty ? const Locale('en') : supported.first,
  );
  if (preferredLocales == null || preferredLocales.isEmpty) {
    return english;
  }

  for (final preferred in preferredLocales) {
    for (final candidate in supported) {
      if (candidate == preferred) return candidate;
    }
  }
  for (final preferred in preferredLocales) {
    for (final candidate in supported) {
      if (candidate.languageCode == preferred.languageCode) return candidate;
    }
  }
  return english;
}
