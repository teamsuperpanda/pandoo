# Security Policy

## Supported versions

Security fixes are shipped for the latest release and the current development
branch. Older builds may not receive a fix.

| Version | Supported |
|---|---|
| Latest release (2.x) | Yes |
| `v3` development | Yes |
| Anything older | No |

## Reporting a vulnerability

Report privately through GitHub private vulnerability reporting:

https://github.com/teamsuperpanda/pandoo/security/advisories/new

Private reporting is enabled for this repository. Do not open a public issue,
pull request or discussion for a security problem.

Please include:

- The app version and build number, and the platform (Android or iOS).
- Steps to reproduce, and the impact you believe it has.
- Whether any data was lost or exposed.
- Any logs or a proof of concept.

## What to expect

- Acknowledgement within 7 days.
- An assessment and a remediation plan within 30 days for confirmed issues.
- Credit in the release notes if you want it.

## Threat model

Pandoo is designed so there is very little to attack:

- **No network access.** The app contains no HTTP client and makes no network
  requests. It does not request the Android `INTERNET` permission.
- **No accounts.** There is no sign-in, identity or server-side state.
- **No telemetry.** No analytics, crash reporting or tracking SDKs.
- **Local data only.** Lists and settings live in Hive files in the app's own
  documents directory. Data at rest is **not encrypted**; the operating
  system's app sandbox is the boundary.

### In scope

- Data loss or corruption in the local Hive store.
- A path where app data leaves the device.
- A crash or denial of service reachable from normal user input.
- A dependency vulnerability that affects the shipped app.

### Out of scope

- An attacker with an unlocked device, root/jailbreak, or physical access to
  app storage. Reading unencrypted local files is a known design tradeoff.
- Vulnerabilities in a fork or a modified build.
- Missing hardening that the platform already provides.

## Dependency security

`flutter pub get` resolves from `pubspec.lock`. Dependabot opens weekly update
PRs. A dependency with a known advisory is treated as a security issue and is
patched on the current branch first.

## Android and iOS specifics

- Android: release builds are signed by the upload key; the keystore is never
  committed. The app declares no network permission.
- iOS: `ITSAppUsesNonExemptEncryption` is `false`; the privacy manifest declares
  the required-reason APIs the app uses.
