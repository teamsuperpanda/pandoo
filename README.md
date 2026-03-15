# Pandoo

<img src="assets/images/icon/icon.png" width="80" alt="Pandoo Icon">

A friendly, local-first todo list app. Fast, minimal, and private by default with offline support and zero cloud overhead.

> Built by [Team Super Panda](https://www.teamsuperpanda.com)

---

## Features

- **Organization**: Multiple lists with custom ordering and pinning.
- **Tasks**: Easy management of todo items with checkboxes.
- **Privacy First**: All data stays on your device. No accounts or tracking.
- **Customization**: Dark/light themes and localization support.
- **UX**: Fast search, drag-and-drop reordering, and smart sorting.

---

## Tech Stack

- **Framework**: [Flutter](https://flutter.dev) (^3.9.0)
- **Persistence**: [Hive](https://pub.dev/packages/hive)
- **State Management**: Reactive [Hive](https://pub.dev/packages/hive_flutter) Listeners
- **Localization**: [Intl](https://pub.dev/packages/intl)
- **UI**: [Awesome Snackbar Content](https://pub.dev/packages/awesome_snackbar_content)

---

## Getting Started

### Prerequisites
- Flutter SDK & Dart: `^3.9.0`

### Install & Run
```bash
git clone https://github.com/teamsuperpanda/pandoo.git
cd pandoo
flutter pub get
flutter run
```

### Tests
```bash
flutter test --coverage
```

---

## Architecture Overview

- **Data**: `Hive` boxes store `lists` and `settings_db` locally.
- **Logic**: `StorageService` handles CRUD operations; `SettingsService` manages preferences.
- **UI**: `ShowLists` for the main view and `ListDetail` for items using `ValueListenableBuilder`.

---

## License

- **Code**: [MIT License](LICENSE).
- **Assets**: Copyright © 2025 Team Super Panda. See [ASSETS-LICENSE.md](ASSETS-LICENSE.md).

For more, visit [www.teamsuperpanda.com](https://www.teamsuperpanda.com).
