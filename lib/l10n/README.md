# Localization

`app_en.arb` is the template. `flutter gen-l10n` generates
`app_localizations*.dart`, which are committed.

## English fallback

Every key must be added to `app_en.arb`. A locale that does not define a key
falls back to the English template at runtime; it does not crash and it does
not hide the string.

This fallback is explicit and tracked: issue #31 completes the translations and
adds a CI gate that fails when a locale is missing a key. Until that gate
exists, adding a key to `app_en.arb` only means the other locales show English
for that one string, never that the app is English-only.

When you add a key:

1. Add it with a description (`@key`) to `app_en.arb`.
2. Run `flutter gen-l10n`.
3. Translate it in as many ARB files as you can; the rest keep the fallback.

## Placeholders

Use `{name}` placeholders and declare them under `@key`. Do not build sentences
by concatenating translations.
