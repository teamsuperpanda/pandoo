# Architecture Overview

[architecture.md](https://architecture.md/) template for rapid codebase comprehension. Update as the codebase evolves.

## 1. Project Structure

```
pandoo/
├── lib/                    # Main application source code
│   ├── main.dart           # App entry point, service init, splash screen
│   ├── core/               # Cross-cutting infrastructure
│   │   └── theme/          # Theme engine
│   │       ├── app_theme.dart     # Light/dark ThemeData (Material 3, bamboo green)
│   │       └── app_spacing.dart   # Spacing/gap/radius token constants
│   ├── dialog/             # Modal dialogs
│   │   ├── clean_dialog.dart        # "Clean completed items" confirmation
│   │   ├── delete_list_dialog.dart  # "Delete list" confirmation
│   │   ├── list_name_dialog.dart    # New list / rename list with validation
│   │   └── settings.dart            # Settings bottom sheet (theme, language, FAB anim)
│   ├── l10n/               # Localization (75 ARB files, generated code)
│   ├── models/             # Data models
│   │   ├── list_model.dart           # ListModel + TodoItem Hive objects
│   │   ├── settings_model.dart       # Settings Hive object
│   │   ├── locale_adapter.dart       # Hive TypeAdapter<Locale>
│   │   └── theme_mode_adapter.dart   # Hive TypeAdapter<ThemeMode>
│   ├── screens/            # Full-screen pages
│   │   ├── home_screen.dart  # Main list view, settings, FAB animation
│   │   └── detail.dart       # Todo item list, search, add item
│   ├── services/            # Singleton service layer
│   │   ├── storage_service.dart   # CRUD for Hive lists box (async-locked mutations)
│   │   └── settings_service.dart  # Settings box CRUD (queued mutations)
│   └── widgets/             # Reusable UI components
│       ├── detail/
│       │   └── add_item.dart       # AddItem wrapper over AddInputBar
│       ├── lists/
│       │   ├── show_lists.dart     # ReorderableListView of ListCards
│       │   └── list_card.dart      # Single list card with pin/delete/popup menu
│       └── shared/
│           └── add_input_bar.dart  # Generic text input + submit button row
├── test/                   # Unit and widget tests (~21 test files)
│   ├── helpers/
│   │   ├── test_helpers.dart     # Hive init for testing
│   │   └── widget_wrapper.dart   # MaterialApp wrapper for l10n in widget tests
│   ├── dialog/             # Per-dialog tests
│   ├── models/             # Model + adapter tests
│   ├── screens/            # Screen-level widget tests
│   ├── services/           # Service CRUD tests
│   ├── widgets/            # Per-widget tests + mock Box
│   ├── pandoo_golden_test.dart # Store screenshot goldens (5 devices x light/dark)
│   └── store_frame.dart    # Store listing screenshot frame widget
├── assets/                 # Static assets
│   ├── fonts/              # Inter font family (9 weights, bundled)
│   └── images/             # Icons, launch screen branding, GitHub banner
├── android/                # Android platform files (AGP 8.11.1, Kotlin 2.2.20)
├── ios/                    # iOS platform files (iOS 13.0+, Scene-based)
├── web/                    # Web platform PWA artifacts
├── pubspec.yaml            # Project manifest
├── analysis_options.yaml   # Linting rules (very_good_analysis)
├── l10n.yaml               # Localization config
├── README.md               # Project overview
├── CONTRIBUTING.md         # Contribution guidelines
├── ASSETS-LICENSE.md       # Asset copyright notice
└── ARCHITECTURE.md         # This document
```

## 2. High-Level System Diagram

```
[User] <--> [Flutter App (Hive)]
                  |
                  No backend. No sync. No accounts.
                  All data stays on device.
```

Hive (key-value NoSQL) is the sole authoritative store. The app is fully offline-first with no sync, no accounts, and no cloud dependency.

## 3. Core Components

### 3.1. Flutter App

**Name:** Pandoo

**Description:** A local-first, offline todo list app. Features list management with pinning, reordering, search, dark mode, FAB animation, and 80+ languages. Minimal, fast, and privacy-respecting.

**Technologies:** Flutter, Dart 3.9+, Hive, Material 3, Google Fonts (Inter)

**Deployment:** Google Play, Apple App Store, Web (PWA)

### 3.2. Data Layer

**Name:** Hive Storage + Singleton Services

**Description:** Two Hive boxes managed through singleton service classes:
- `StorageService` — `lists` box storing `ListModel` objects (keyed by list name). Mutations are serialized via an internal `_AsyncLock`.
- `SettingsService` — `settings_db` box storing a single `Settings` object under key `app_settings`. Mutations are serialized via a chained `_mutationQueue`.

Both services expose `ValueListenable`/`ValueNotifier` for reactive UI updates via `ValueListenableBuilder`.

**Technologies:** Hive ^2.0.0, Hive Flutter, custom TypeAdapters

**Custom adapters:** `LocaleAdapter` (typeId: 101), `ThemeModeAdapter` (typeId: 100)

**Data schemas:**
- `ListModel` (HiveTypeId: 0) — `name`, `items` (List\<TodoItem\>), `order`, `pinned`
- `TodoItem` (HiveTypeId: 1) — `text`, `isCompleted`, `id` (auto-generated from timestamp)
- `Settings` (HiveTypeId: 2) — `locale`, `theme`, `fabAnimation`

### 3.3. Theme Engine

**Name:** AppTheme

**Description:** Material 3 theme system with bamboo-green primary color palette. Fully customized light and dark themes covering all Material components (AppBar, Card, FAB, InputDecoration, Checkbox, Switch, SnackBar, BottomSheet, DropdownMenu, Dialog, PopupMenu, Buttons, Tooltip, Divider). Uses bundled Inter font via Google Fonts package (`allowRuntimeFetching = false` in tests).

**Technologies:** Material 3, `ThemeData`, `GoogleFonts.interTextTheme()`

### 3.4. UI / Navigation

**Name:** Navigator.push + Bottom Sheets

**Description:** No named routing library. Navigation via `Navigator.push` with `MaterialPageRoute` for detail screen. Settings opened as a bottom sheet. Simple and sufficient for the app's two-screen structure.

**Technologies:** Flutter Navigator, `showModalBottomSheet`

### 3.5. State Management

**Name:** ValueListenableBuilder (no state management library)

**Description:** Widgets subscribe directly to Hive box changes via `StorageService().getBoxNotifier()` and `SettingsService().notifier` using `ValueListenableBuilder`. No Riverpod, no Bloc, no Provider needed for the app's simple data flows.

**Technologies:** Flutter `ValueListenableBuilder`, `ValueNotifier`

## 4. Module Boundary Convention

- **`screens/`** — Full-screen pages composing widgets and managing screen-level state. May access services directly.
- **`widgets/`** — Reusable UI components organized by context (`detail/`, `lists/`, `shared/`). No direct service access — receive data via constructor parameters.
- **`dialog/`** — Modal dialogs and bottom sheets. May access services for settings reads/writes.
- **`services/`** — Singleton service layer encapsulating Hive operations. Expose `ValueListenable` for reactive UI.
- **`models/`** — Pure data models with Hive annotations and custom TypeAdapters.
- **`core/`** — Cross-cutting infrastructure (theme, spacing tokens).

**Dependency rule:** `widgets/` never imports from `screens/`. `screens/` may import from `widgets/` and `services/`. `services/` may import from `models/`. `models/` has no app-layer dependencies.

## 5. Data Stores

### 5.1. Primary Database

**Name:** Hive

**Type:** Key-value NoSQL (embedded)

**Purpose:** Authoritative data store for all app data. Offline-first — never bypassed.

**Boxes:**
- `lists` — `ListModel` objects keyed by list name string
- `settings_db` — Single `Settings` object under key `app_settings`

## 6. External Integrations / APIs

None. This is a fully offline, local-first application with no network dependencies. Fonts are bundled as assets (no network font loading). No HTTP client dependencies exist in the project.

## 7. Deployment & Infrastructure

- **CI/CD:** GitHub Actions (`ci.yml`) — analyze, format check, gen-l10n, test with coverage
- **Platforms:** Android, iOS, Web
- **Code Generation:** Hive `.g.dart` adapters are committed in the repository
- **Distribution:** Google Play, Apple App Store
- **Dependabot:** Weekly pub and GitHub Actions updates

## 8. Security Considerations

- **Data at rest:** Stored locally in Hive boxes via path_provider. No encryption.
- **Network:** No network requests. No telemetry. No analytics.
- **Accessibility:** Semantics widgets throughout, localized screen reader labels.

## 9. Development & Testing

- **Testing:** `flutter_test` for unit and widget tests (~21 test files). Golden screenshot tests across 5 device configurations for store listings.
- **Linting:** `very_good_analysis`
- **Localization:** ARB-based (`l10n.yaml`, 75 ARB files)
- **Test injection:** `StorageService.setTestInstance()` and `SettingsService.setTestInstance()` for swapping Hive boxes during tests
- **Mock box:** `test/widgets/helpers/mock_box.dart` — Full `Box<ListModel>` mock supporting error injection

## 10. Future Considerations

- **State management library:** Consider Provider or Riverpod if the widget tree grows beyond simple ValueListenableBuilder patterns
- **Named routing:** Consider `go_router` or declarative routing as pages grow
- **Data export/backup:** Add JSON export or cloud backup
- **List sharing:** Allow sharing lists via text or link
- **Recurring/repeating items:** Template-based recurring todo items

## 11. Project Identification

**Project Name:** Pandoo

**Repository URL:** https://github.com/teamsuperpanda/pandoo

**License:** PolyForm Noncommercial 1.0.0

**Date of Last Update:** 2026-07-24

## 12. Glossary

**Hive:** Lightweight, fast key-value database for Flutter/Dart

**ValueListenableBuilder:** Flutter widget that rebuilds automatically when a `ValueListenable` changes

**Singleton service:** A class with a single instance throughout the app lifecycle, accessed via a factory constructor

**TypeAdapter:** Hive's serialization mechanism for custom types

**Material 3:** The latest Material Design specification with dynamic color and updated components

**Async lock:** Sequential async execution pattern ensuring only one mutation runs at a time
