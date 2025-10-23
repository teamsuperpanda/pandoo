# Pandoo - AI Coding Agent Instructions

## Project Overview
Pandoo is a Flutter-based todo list application that uses Hive for local data persistence. The app supports multiple lists with todo items, pinning, reordering, and includes localization and theming features.

## Architecture & Data Flow
- **Storage**: Hive NoSQL database with singleton `StorageService` managing all CRUD operations
- **Models**: `ListModel` (contains `TodoItem`s), `SettingsModel` - all Hive-serializable with generated adapters
- **UI Pattern**: Feature-organized widgets (`widgets/lists/`, `widgets/detail/`) with reactive updates via `ValueListenableBuilder`
- **Services**: Singleton pattern for `StorageService` and `SettingsService` - initialize in `main()` before `runApp()`
- **State Management**: Reactive UI updates through Hive box listeners, no complex state management library

## Key Conventions
- **Data Persistence**: Always update entire model instances when modifying Hive objects (immutable updates)
- **Widget Updates**: Use `ValueListenableBuilder<Box<ListModel>>` to react to storage changes automatically
- **Navigation**: `MaterialPageRoute` for screen transitions, pass list names as route parameters
- **Theming**: Pure black/white color scheme, Material 3, theme changes persist via `SettingsService`
- **Localization**: ARB files in `lib/l10n/`, access via `context.l10n.keyName`

## Developer Workflows
- **Code Generation**: Run `flutter pub run build_runner build` after modifying Hive models to regenerate adapters
- **Testing**: Use `MockBox` for storage service tests, focus on service layer unit tests over full widget tests
- **Assets**: Icons and splash screens configured in `pubspec.yaml`, run `flutter pub run flutter_launcher_icons` and `flutter pub run flutter_native_splash:create` for updates
- **CI/CD**: GitHub Actions runs `flutter analyze` and `flutter test --coverage` on PRs

## Common Patterns
- **List Operations**: Pinned lists sort alphabetically, unpinned by order field - maintain this in `StorageService.getAllLists()`
- **Item Management**: Generate unique IDs using `DateTime.now().toIso8601String()` for todo items
- **Dialogs**: Custom dialogs in `lib/dialog/` for settings and confirmations
- **Error Handling**: Basic try/catch in initialization, show snackbars with `awesome_snackbar_content`

## Integration Points
- **Hive Initialization**: Call `Hive.initFlutter()`, register adapters, open boxes in `StorageService.init()`
- **Settings Persistence**: Theme and locale stored separately from lists, loaded synchronously on app start
- **Splash Screen**: `flutter_native_splash` preserves screen during async initialization

## Library Documentation
Use the Context7 MCP server (`mcp_upstash_conte_get-library-docs`) for latest documentation on:
- Flutter framework updates
- Hive database patterns
- `awesome_snackbar_content` usage
- `intl` localization best practices

## File Structure Reference
- `lib/services/storage_service.dart` - Core data operations
- `lib/models/list_model.dart` - Data structures with Hive annotations
- `lib/widgets/lists/show_lists.dart` - Main list display with reordering
- `lib/core/theme/app_theme.dart` - Black/white Material 3 theme
- `test/services/storage_service_test.dart` - Mock-based service testing</content>

## Accessibility & WCAG AA
- Goal: Ensure UI meets WCAG AA contrast and accessibility best practices for text, interactive controls, and navigation.
- When changing colors or components, prefer minimal visual change while achieving at least 4.5:1 contrast for normal text and 3:1 for large text. Document the contrast pairs changed.
- Semantic labels: Add `semanticLabel` or `Semantics` widgets for non-text controls (icons, custom tappable regions). Use localized strings for labels (`AppLocalizations.of(context)!` where applicable).
- Touch targets: Ensure interactive controls have a minimum tappable area of 44x44 logical pixels. Use `IconButton.styleFrom(minimumSize: Size(48,48))` (current project convention) and verify it across platforms.
- Keyboard and focus: Ensure focusable widgets (buttons, list items, dialogs) show visible focus outlines. Use `Focus`/`FocusTraversalGroup` when necessary for complex custom controls.
- Contrast checks: Add unit or widget tests for theme color contrast. Use a small utility to calculate relative luminance and contrast ratio for color pairs.
- Accessibility tests: Add widget tests that assert presence of accessibility labels for primary flows (list rename, add item, checkbox toggle, cleanup action).
- CI: Extend GitHub Actions to run `flutter analyze`, `flutter test --coverage`, and a custom `tool/contrast_check.dart` script that fails the job if any color pair used in the theme falls below AA ratios.

Notes for the AI agent:
- Prefer accessibility-preserving edits. If a proposed change reduces accessibility (e.g., lowering contrast), propose alternative approaches (e.g., increase weight, add underline, or use larger text) instead.
- When modifying `lib/core/theme/app_theme.dart`, add a short comment explaining why colors were changed and include before/after contrast ratios.
- If automatic theme updates are applied, also add/update small widget tests (`test/widgets/accessibility_theme_test.dart`) that verify contrast ratios and presence of semantic labels for a couple of key widgets.

<parameter name="filePath">/home/howley/Documents/GitHub/pandoo/.github/copilot-instructions.md