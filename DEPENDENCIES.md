# Dependency and Upgrade Policy

Pandoo has few dependencies on purpose. This policy keeps them current without
letting an upgrade break the app silently.

## Ranges and lockfile

- Every dependency in `pubspec.yaml` uses a caret range (`^x.y.z`).
- `pubspec.lock` is committed. CI installs from it, so a green build reflects
  exactly the versions that were tested.
- Never edit `pubspec.lock` by hand. Change `pubspec.yaml`, run
  `flutter pub get`, and commit both files.

## Cadence

| Cadence | What |
|---|---|
| Weekly | Dependabot PRs, grouped into one minor/patch PR per ecosystem |
| Monthly | Review and merge the grouped minor/patch PR, then run the full gate |
| On a Flutter stable release | Evaluate within two weeks, not automatically |
| Ad hoc | A security advisory is patched immediately on the active branch |

## What still needs a manual check

Passing tests does not cover native behavior. After any upgrade, run:

```bash
flutter pub get
flutter gen-l10n
dart format --set-exit-if-changed lib/ test/
flutter analyze
flutter test --coverage
```

Then smoke test on a device or emulator if one is available: launch, add a
list, add and complete an item, swipe to delete, open settings, change theme
and language, restart and confirm the data and settings persisted.

No JDK, Android SDK, Xcode or macOS is available in the development container,
so device builds are verified by CI only.

## Major upgrades

A major version bump needs its own PR with:

1. The changelog and breaking changes read and summarized in the PR body.
2. The full gate run locally.
3. A migration note if stored data or a model changes, with a test using a real
   fixture from the previous version.
4. A device smoke test, or an explicit note that CI is the only verification.
5. The `pubspec.lock` diff reviewed for unexpected transitive changes.

## Riskiest packages and runbooks

### `hive` / `hive_flutter`

Storage is the highest-risk dependency: a bad upgrade can lose user data.

1. Check the `hive_ce` migration plan (#48) before any Hive change.
2. Back up a real device box file before upgrading.
3. Open a test box written by the previous version and assert every list and
   item still reads correctly.
4. Never change a `typeId` or a `@HiveField` index in place; add fields and
   migrate (#49).

### `flutter_native_splash`

Affects the native launch screen only.

1. Change the config in `pubspec.yaml`.
2. Run `dart run flutter_native_splash:create`.
3. Check Android 12+ and iOS launch screens in both light and dark mode.
4. Confirm the splash is removed after init (`FlutterNativeSplash.remove()`).

### `awesome_snackbar_content`

Used only by `showErrorSnackBar`. Replacing it with Material snackbars is
tracked in #55. Until then, check the snackbar still renders in light and dark
and that it is announced by screen readers.

### Flutter itself

1. Read the release notes for breaking changes that affect Material widgets,
   `gen-l10n` or Hive.
2. Update the CI `flutter-version` pin (#63) in the same PR.
3. Run the full gate, then the goldens; regenerate only for intentional changes.
4. Record the version in `RELEASES.md`.

## Recording toolchain versions

Each release adds a row to `RELEASES.md` with the app version, the Flutter
version and the Dart version used. The release checklist in
`RELEASE_CHECKLIST.md` requires it.
