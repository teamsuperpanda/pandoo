# Releasing

Two workflows cooperate:

- **Release** (`.github/workflows/release.yml`, #25): on a `v*` tag it runs the
  gate, builds the signed AAB and APK, attaches them to the GitHub release and
  fails if the tag does not match `pubspec.yaml`.
- **Store release** (`.github/workflows/store.yml`, #98): runs after Release
  succeeds. It downloads the AAB and uploads it to the Play internal track, and
  builds and uploads the IPA to TestFlight.

## Steps

1. Bump `version` in `pubspec.yaml` (name and build number).
2. Update `release_notes.json` (22 languages).
3. Regenerate the store changelogs and commit them:

   ```bash
   dart run tool/generate_changelogs.dart
   ```

   This writes `android/fastlane/metadata/android/<locale>/changelogs/<versionCode>.txt`
   and `ios/fastlane/metadata/<locale>/release_notes.txt`. CI runs the same
   script with `--check` and fails if the newest changelog is missing or stale.
4. Add a row to `RELEASES.md`.
5. Tag and push: `git tag v2.5.0 && git push origin v2.5.0`.
6. Watch Release, then Store release. Fix forward; never re-tag a broken build.

## Required secrets

Android build and GitHub release:

| Secret | Purpose |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | Base64 of the upload keystore |
| `ANDROID_STORE_PASSWORD` | Keystore password |
| `ANDROID_KEY_ALIAS` | Upload key alias |
| `ANDROID_KEY_PASSWORD` | Upload key password |

Play upload:

| Secret | Purpose |
|---|---|
| `PLAY_SERVICE_ACCOUNT_JSON` | Play Console service account JSON with release permissions |

iOS / TestFlight:

| Secret | Purpose |
|---|---|
| `APPLE_ID` | Apple developer account email |
| `APPLE_TEAM_ID` | Apple team id |
| `MATCH_GIT_URL` | Private certificates repository |
| `MATCH_PASSWORD` | Match encryption password |
| `APP_STORE_CONNECT_KEY_ID` | App Store Connect API key id |
| `APP_STORE_CONNECT_ISSUER_ID` | App Store Connect issuer id |
| `APP_STORE_CONNECT_KEY_CONTENT` | App Store Connect API key (`.p8`) contents |

## Notes

- No store credentials are committed. The keystore is decoded into the runner's
  temp directory and is never uploaded.
- The iOS job runs on `macos-14`. It cannot be exercised in the development
  container (no Xcode); the first tag on a configured repository is the real
  test.
- Fastlane itself is installed by `ruby/setup-ruby` plus `bundle exec`; add a
  `Gemfile` when the first release is cut if the runner does not provide
  Fastlane.
