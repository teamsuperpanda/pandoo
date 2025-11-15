# Pandoo

<img src="assets/images/icon/icon.png" width="100" alt="Pandoo Icon">

Pandoo is a friendly, local-first todo list app built with Flutter and Hive. It's designed to be fast, minimal, and private by default. Your todo lists and items stay on your device and are always available offline.

> Built with care by [Team Super Panda](https://www.teamsuperpanda.com)

---

## Download

Get Pandoo on the Google Play Store:

<a href="https://play.google.com/store/apps/details?id=com.teamsuperpanda.pandoo"><img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" width="200" alt="Get it on Google Play"></a>

---

## What is Pandoo?

Pandoo is a simple todo list app for people who want:

- Multiple lists: Organize your tasks into different categories
- Todo items: Add, check off, and manage individual tasks
- Pinned lists: Keep your most important lists at the top
- Dark & light themes: Easy on the eyes, day or night
- Fast search: Find lists and items quickly
- Smart sorting: Sort lists alphabetically or by custom order
- Local-first storage: All data stays on your device via Hive
- Zero cloud overhead: No accounts, no sync setup, no third-party services
- Localization: Support for multiple languages

If you want a focused, distraction‑free place to manage your tasks that "just works" on your device, Pandoo is for you.

---

## How it works

Pandoo uses a clean architecture to keep the app reliable and easy to extend.

### Data & persistence

- Local database: [Hive](https://github.com/hivedb/hive) stores all lists, items, and settings on-device
- Hive boxes:
  - `lists` - All user lists and their todo items
  - `settings_db` - Theme, locale, and other preferences

### Business logic

- `StorageService` (`lib/services/storage_service.dart`)
  - Handles all data operations: create, update, delete lists and items
  - Manages pinned lists and custom ordering
- `SettingsService` (`lib/services/settings_service.dart`)
  - Manages theme and localization preferences
- Initialization in `main()` before `runApp()`

### UI & state management

- `ShowLists` (`lib/widgets/lists/show_lists.dart`)
  - Main list view with reordering and pinning controls
- `ListDetail` (`lib/widgets/detail/`)
  - Todo item management for individual lists
- Reactive updates via `ValueListenableBuilder<Box<ListModel>>`

All state is managed reactively through Hive box listeners, so UI widgets automatically rebuild when data changes.

---

## Features

- **Multiple lists** with custom names and organization
- **Todo items** with checkboxes and management
- **Pin important lists** so they stay at the top
- **Reorder lists** with drag and drop
- **Dark mode** with persistent theme preference
- **Localization** with ARB files and intl package
- **Local-first storage** using Hive (no network required)
- **Unique IDs** for lists and items across sessions

---

## Tech stack

- **Framework**: [Flutter](https://flutter.dev) (Dart ^3.9.0)
- **Local storage**: [Hive](https://github.com/hivedb/hive)
- **State management**: Reactive with Hive listeners
- **Localization**: [Intl](https://pub.dev/packages/intl)
- **Notifications**: [Awesome Snackbar Content](https://pub.dev/packages/awesome_snackbar_content)
- **Splash screen**: [Flutter Native Splash](https://pub.dev/packages/flutter_native_splash)

---

## Getting started

### Prerequisites

- Flutter SDK: `^3.9.0`
- Dart: `^3.9.0`

Make sure Flutter is installed and configured for your platform (Android, iOS, web, desktop).

### Install & run

1. **Clone the repository**

   ```bash
   git clone https://github.com/teamsuperpanda/pandoo.git
   cd pandoo
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

By default, Flutter will prompt you to pick a connected device or emulator/simulator.

### Running tests

Run the full test suite with coverage:

```bash
flutter test --coverage
```

Run tests for specific components:

```bash
flutter test test/services/storage_service_test.dart        # Core data operations
flutter test test/widgets/lists/show_lists_test.dart       # UI: main list view
```

---

## Contributing

We'd love your help making Pandoo better.

Whether it's a bug report, feature idea, design tweak, or documentation improvement—contributions of all sizes are welcome.

### Ways to contribute

- Report bugs – Open a GitHub issue with steps to reproduce
- Suggest features – Share what you'd like to see next
- Improve tests – Add or refine unit and widget tests
- Polish the UI/UX – Small design improvements are very welcome
- Docs – Help make the project easier to understand

### Contribution flow

1. **Fork** the repository
2. **Create a branch** for your idea

   ```bash
   git checkout -b feature/your-idea
   ```

3. **Make your changes**
   - Keep the existing architecture and style in mind
   - Add or update tests where it makes sense

4. **Run tests**

   ```bash
   flutter test
   ```

5. **Open a Pull Request**
   - Describe what you changed and why
   - Include screenshots/GIFs for UI changes if possible

We'll review and discuss your contribution. Thank you for helping Pandoo grow.

---

## License & assets

The application source code is licensed under the [MIT License](LICENSE).

**Important notes:**

- The MIT License allows commercial use, but rebranding this app as your own and selling it without meaningful modifications is **not** in the spirit of this project.
- We encourage contributions and derivative works that add value and respect the original branding.

### Assets

Unless otherwise noted, all application assets (including icons and launch screen images under `assets/images/`) are **not** licensed under MIT and are copyright © 2025 Team Super Panda.

See [ASSETS-LICENSE.md](ASSETS-LICENSE.md) for full asset licensing details.

---

## Learn more about Team Super Panda

Pandoo is maintained by **Team Super Panda**, a small group that loves building thoughtful, privacy-friendly tools.

Visit us at **[www.teamsuperpanda.com](https://www.teamsuperpanda.com)** to learn more, follow our work, or say hi.

If you ship something cool with Pandoo—or build your own spin‑off—let us know. We'd love to see what you create.
