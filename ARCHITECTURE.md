# Architecture Overview

This document describes the codebase as it exists on the `v3` branch. Update it
when the tree changes.

## 1. Project Structure

```
pandoo/
├── lib/                    # Application source
│   ├── main.dart           # Entry point, service init, splash screen, MaterialApp
│   ├── core/
│   │   └── theme/
│   │       ├── app_theme.dart     # Light and dark ThemeData (Material 3, bamboo green)
│   │       └── app_spacing.dart   # Spacing, gap and radius tokens
│   ├── dialog/             # Modal dialogs
│   │   ├── clean_dialog.dart        # "Clean completed items" confirmation
│   │   ├── delete_list_dialog.dart  # "Delete list" confirmation
│   │   ├── list_name_dialog.dart    # New / rename list with validation
│   │   └── settings.dart            # Settings dialog (theme, language, FAB animation)
│   ├── l10n/               # 75 ARB files and the committed generated code
│   ├── models/
│   │   ├── list_model.dart          # ListModel + TodoItem Hive objects
│   │   ├── list_model.g.dart        # Committed Hive adapter (typeIds 0 and 1)
│   │   ├── settings_model.dart      # Settings Hive object
│   │   ├── settings_model.g.dart    # Committed Hive adapter (typeId 2)
│   │   ├── locale_adapter.dart      # TypeAdapter<Locale> (typeId 101)
│   │   └── theme_mode_adapter.dart  # TypeAdapter<ThemeMode> (typeId 100)
│   ├── screens/
│   │   ├── home_screen.dart  # List overview, settings entry, FAB
│   │   └── detail.dart       # Todo items for one list, search, add item
│   ├── services/
│   │   ├── storage_service.dart   # CRUD for the Hive lists box (async-locked mutations)
│   │   └── settings_service.dart  # Settings box CRUD (queued mutations)
│   └── widgets/
│       ├── lists/
│       │   ├── show_lists.dart     # ReorderableListView of ListCards
│       │   └── list_card.dart      # List card: drag handle, pin, menu, swipe actions
│       └── shared/
│           ├── add_input_bar.dart  # Text field plus submit button
│           └── app_snackbar.dart   # Error snackbar helper
├── test/                   # Unit, widget and golden tests (21 Dart files)
│   ├── helpers/            # Hive init and MaterialApp l10n wrapper
│   ├── dialog/             # Per-dialog tests
│   ├── models/             # Model and adapter tests
│   ├── screens/            # Screen-level widget tests
│   ├── services/           # Service CRUD tests
│   ├── widgets/            # Widget tests and the mock box
│   ├── pandoo_golden_test.dart  # Store screenshots, 5 devices x light/dark
│   └── store_frame.dart         # Store screenshot frame
├── assets/
│   ├── fonts/              # Inter Regular, Medium, SemiBold, Bold (bundled)
│   └── images/             # Icons, launch screen art, GitHub banner
├── android/                # Android platform files
├── ios/                    # iOS platform files
├── pubspec.yaml
├── analysis_options.yaml
├── l10n.yaml
├── README.md
├── CONTRIBUTING.md
├── ASSETS-LICENSE.md
├── THIRD_PARTY.md
├── TRADEMARKS.md
└── ARCHITECTURE.md
```

There is no `web/` directory. The app ships for Android and iOS only.

## 2. High-Level System Diagram

```
[User] <--> [Flutter App (Hive)]
                  |
                  No backend. No sync. No accounts.
                  All data stays on device.
```

Hive (key-value NoSQL) is the only data store. The app is fully offline: there
is no HTTP client dependency, no analytics SDK and no account system.

## 3. Core Components

### 3.1. Flutter App

**Description:** A local-first, offline todo list. Multiple lists with pinning,
drag reordering and swipe actions; per-list search; add, complete and delete
items; light and dark themes; 75 locales; an optional FAB animation.

**Technologies:** Flutter, Dart 3.9+, Hive, Material 3, the bundled Inter font.

### 3.2. Data Layer

Two Hive boxes accessed through singleton services:

- `StorageService` - the `lists` box of `ListModel` objects, currently keyed by
  list name. Mutations are serialized through an internal `_AsyncLock`.
- `SettingsService` - the `settings_db` box holding one `Settings` object under
  `app_settings`. Mutations are serialized through a chained promise.

Both expose a `ValueListenable` so widgets rebuild when data changes:
`StorageService().getBoxNotifier()` and `SettingsService().notifier`.

**Adapters:** `ListModel` (0), `TodoItem` (1), `Settings` (2),
`ThemeModeAdapter` (100), `LocaleAdapter` (101). The generated `*.g.dart`
adapters are committed, so `build_runner` is not part of the build.

**Schemas:**
- `ListModel` - `name`, `items` (`List<TodoItem>`), `order`, `pinned`
- `TodoItem` - `text`, `isCompleted`, `id`
- `Settings` - `locale`, `theme`, `fabAnimation`

### 3.3. Theme Engine

`AppTheme` builds Material 3 light and dark `ThemeData` from a bamboo-green
palette and sets `fontFamily: 'Inter'`. Inter is bundled under `assets/fonts/`
and registered in `pubspec.yaml`; the app never fetches fonts at runtime.

### 3.4. UI / Navigation

No routing package. Navigation is `Navigator.push` with `MaterialPageRoute`
from the home list to the detail screen. Settings open as an `AlertDialog` via
`showDialog`, not a bottom sheet.

### 3.5. State Management

No state management package. Widgets subscribe to Hive through
`ValueListenableBuilder` and to settings through `SettingsService().notifier`.

## 4. Module Boundary Convention

- `screens/` - full screens, compose widgets and may use services.
- `widgets/` - reusable components; no direct service access except the shared
  list actions that the screen wires in. Never import a screen.
- `dialog/` - modal dialogs; may read and write settings.
- `services/` - singleton Hive access, exposing `ValueListenable`.
- `models/` - Hive models and adapters, no app-layer dependencies.
- `core/` - cross-cutting theme and spacing tokens.

## 5. Data Stores

### 5.1. Hive

- `lists` - one `ListModel` per list, currently keyed by list name.
- `settings_db` - one `Settings` under `app_settings`.

Both live in the app documents directory via `path_provider` (through
`hive_flutter`). Data at rest is unencrypted.

## 6. External Integrations

None. No HTTP client, no accounts, no telemetry, no crash reporting. The only
platform integrations are `path_provider` (storage location) and
`flutter_native_splash` (launch screen configuration).

## 7. Deployment & Infrastructure

- **CI/CD:** `.github/workflows/ci.yml` runs `flutter pub get`, `gen-l10n`, a
  format check, `flutter analyze` and `flutter test --coverage`.
- **Platforms:** Android and iOS.
- **Code generation:** Hive adapters are committed and edited in place.
- **Distribution:** Google Play and the Apple App Store.

## 8. Security Considerations

- **Data at rest:** Hive files in the app documents directory, not encrypted.
- **Network:** no network calls, no telemetry, no analytics, no accounts.
- **Accessibility:** semantic labels for lists, items and actions; localized
  screen-reader strings.

## 9. Development & Testing

- **Tests:** 21 Dart test files covering models, adapters, services, dialogs,
  widgets and screens, plus golden screenshots for five devices in light and
  dark.
- **Linting:** `very_good_analysis`.
- **Localization:** `l10n.yaml` at the repo root, 75 ARB files in `lib/l10n`.
- **Injection for tests:** `StorageService.setTestInstance()` and
  `SettingsService.setTestInstance()` swap in test boxes.
- **Mock box:** `test/widgets/helpers/mock_box.dart`.

## 10. Future Considerations

See `ROADMAP.md`. Named routes, a migration framework, stable list IDs and
backup/export are tracked as v3 work rather than implemented here.

## 11. Project Identification

- **Project:** Pandoo
- **Repository:** https://github.com/teamsuperpanda/pandoo
- **License:** MIT
- **Last updated:** 2026-11-07

## 12. Glossary

**Hive:** embedded key-value database for Dart.

**ValueListenableBuilder:** Flutter widget that rebuilds when a listenable
changes.

**Singleton service:** a class exposing one shared instance through a factory
constructor.

**TypeAdapter:** Hive's serialization mechanism for custom types.

**Material 3:** Flutter's Material Design 3 implementation.
