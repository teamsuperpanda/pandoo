# Pandoo 🐼

<img src="assets/images/icon/icon.png" width="80" alt="Pandoo Icon">

**Your friendly, local-first todo list.** Fast. Minimal. Private. No clouds, no accounts — just you and your tasks. Analytics is anonymous and opt-out.

> A [Team Super Panda](https://www.teamsuperpanda.com) production

---

## Features

- **Stay Organized** — Multiple lists, custom ordering, pin what matters.
- **Task Mastery** — Checkboxes, drag-and-drop reordering, smart sorting.
- **Privacy First** — Your data never leaves your device. Zero servers. Anonymous analytics, opt-out anytime.
- **Your Vibe** — Dark & light themes + localization.
- **Lightning Fast** — Search through everything instantly.

---

## Tech Stack

| What | How |
|------|-----|
| Framework | [Flutter](https://flutter.dev) (^3.9.0) |
| Storage | [Hive](https://pub.dev/packages/hive) — snappy local DB |
| State | Hive reactive listeners |
| i18n | [Intl](https://pub.dev/packages/intl) |
| Snacks | [Awesome Snackbar Content](https://pub.dev/packages/awesome_snackbar_content) |

---

## Getting Started

```bash
git clone https://github.com/teamsuperpanda/pandoo.git
cd pandoo
flutter pub get
flutter run
```

### Run Tests

```bash
flutter test --coverage
```

---

## How It Works

- **Data** lives in local Hive boxes (`lists`, `settings_db`).
- **Logic** stays clean — `StorageService` for CRUD, `SettingsService` for prefs.
- **UI** stays snappy — `ValueListenableBuilder` keeps everything in sync.

---

## License

- **Code**: [PolyForm Noncommercial 1.0.0](LICENSE)
- **Assets**: © 2026 Team Super Panda — see [ASSETS-LICENSE.md](ASSETS-LICENSE.md)

[teamsuperpanda.com](https://www.teamsuperpanda.com)
