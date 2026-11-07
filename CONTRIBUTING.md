# Contributing

Contributions are welcome. This project is MIT licensed and ships without
network access, accounts or telemetry; keep it that way.

## Getting started

1. Fork the repository and clone your fork.
2. Install dependencies: `flutter pub get`.
3. Generate the localization code: `flutter gen-l10n`.
4. Check your setup: `flutter analyze && flutter test`.

`*.g.dart` Hive adapters and the `lib/l10n/app_localizations*.dart` output are
committed. A normal build needs no code generation. If you change a Hive model
field, update the matching `*.g.dart` adapter by hand to keep it in sync
(`build_runner` is not currently a dependency; see #58).

## Branches and pull requests

- `main` is the released code. New work targets the active development branch
  (`v3` while v3 is in progress).
- Branch from that branch, keep the change focused, and open the PR against it.
- Do not push to `main`.

## Code quality

- `flutter gen-l10n` if you changed an ARB file.
- `dart format lib/ test/`.
- `flutter analyze` must print `No issues found!`.
- `flutter test --coverage` must pass.
- Add or update tests for behavior changes; UI changes need a widget test and,
  when the layout is intentional, updated goldens (`flutter test --update-goldens`).
- Never use `// ignore:` to silence a lint.

## Localization

Every user-facing string belongs in the ARB files. Add new keys to
`lib/l10n/app_en.arb`, translate them in the other ARB files or use the
documented English fallback, then run `flutter gen-l10n`. Do not hardcode
English in widgets.

## Assets

Bundled artwork is CC BY 4.0 and the code is MIT. The Pandoo name, panda mark
and store records are not licensed for reuse; see `TRADEMARKS.md`.

## License headers

Every new file must declare its license so `reuse lint` passes. Either add an
SPDX header:

```dart
// SPDX-FileCopyrightText: 2026 Team Super Panda
// SPDX-License-Identifier: MIT
```

or add the file to the matching `[[annotations]]` block in `REUSE.toml`.
Code is MIT, bundled artwork is CC BY 4.0, and the Inter font is OFL-1.1.

## Release signing

Release builds need a keystore. Create `android/key.properties` (gitignored) or
set the environment variables:

```
storeFile=/absolute/path/to/upload-keystore.jks
storePassword=...
keyAlias=upload
keyPassword=...
```

The Gradle build fails rather than fall back to the debug key. Never commit a
keystore or its passwords.
