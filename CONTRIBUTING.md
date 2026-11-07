# Contributing

Contributions are welcome! Please follow these guidelines.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/teamsuperpanda/pandoo.git`
3. Install dependencies: `flutter pub get`
4. Run code generation: `dart run build_runner build --delete-conflicting-outputs`
   > `*.g.dart` files are gitignored — you must run this step before building.
5. Verify setup: `flutter analyze && flutter test`

## Code Quality

- Run `flutter analyze` before committing — zero issues required
- Run `flutter test` — all tests must pass
- Follow the existing code style (see `analysis_options.yaml`)

## Pull Request Process

1. Create a feature branch from `main`
2. Make your changes
3. Ensure `flutter analyze` and `flutter test` pass
4. Update tests if adding functionality
5. Submit a PR with a clear description of changes

## Localization fallback

New strings go into `lib/l10n/app_en.arb` and `flutter gen-l10n` is run after.
Locales that do not yet define a key fall back to the English template at
runtime (documented in `lib/l10n/README.md` once #23 lands). #31 completes the
translations and adds a CI gate for missing keys.
