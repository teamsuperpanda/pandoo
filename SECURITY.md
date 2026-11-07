# Security Policy

## Supported versions

Security fixes ship for the latest release and the current development branch.

## Reporting a vulnerability

Report privately through GitHub private vulnerability reporting:

https://github.com/teamsuperpanda/pandoo/security/advisories/new

Do not open a public issue for a security problem. Include the app version,
platform, reproduction steps and whether data was lost.

## Threat model

- **No network access.** The app makes no network requests and requests no
  `INTERNET` permission.
- **No accounts.** There is no sign-in or server-side state.
- **No telemetry.** No analytics, crash reporting or tracking SDKs.
- **Local data only.** Lists and settings live in Hive files in the app's own
  documents directory. Data at rest is not encrypted; the OS app sandbox is
  the boundary.

## OS backups

Decision: **exclude Pandoo data from operating-system backups** and rely on the
in-app export.

- Android: `android:allowBackup="false"` and `android:fullBackupContent="false"`
  in `AndroidManifest.xml`, so Hive boxes are not included in Google auto-backup
  or device-to-device transfer.
- iOS: `AppDelegate` sets `isExcludedFromBackup` on the Documents directory,
  so Hive boxes are not included in iCloud or computer backups.

This makes the claim in the README and store listing true: data does not leave
the device unless the user explicitly exports it. Consequence: reinstalling the
app or moving to a new device without an export loses the data. The export and
import work is tracked in #42 and #44.
