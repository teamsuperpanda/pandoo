# Release Checklist

Run through this list for every release.

## Version and toolchain

- [ ] `pubspec.yaml` version is bumped (version name and build number).
- [ ] The tag matches the pubspec version and CI rejects a mismatch.
- [ ] `RELEASES.md` has a row with the Flutter and Dart versions used.
- [ ] `release_notes.json` is updated and every changelog file matches the build number.

## Build and signing

- [ ] Release signing comes from secrets or `android/key.properties`; the build fails without it.
- [ ] No keystore, password or `key.properties` is committed.
- [ ] CI produced the AAB and APK and attached them to the release.

## Privacy

Re-audit both manifests on **every SDK, plugin or Flutter upgrade**, and whenever
a dependency that touches storage, preferences or files is added.

### iOS privacy manifest (`ios/Runner/PrivacyInfo.xcprivacy`)

- [ ] The build links no "required reason" API that is missing from the manifest.
- [ ] The manifest lists no API the app does not call. Remove an entry when the dependency that needed it goes away.
- [ ] `NSPrivacyTracking` is `false` and no tracking domains or collected data types are declared.
- [ ] `ITSAppUsesNonExemptEncryption` in `Info.plist` is still `false`, or export compliance has been updated.

Current entries and why:

| API category | Reason | Why it is needed |
|---|---|---|
| `NSPrivacyAccessedAPICategoryFileTimestamp` | `C617.1` | Hive and path_provider stat files inside the app container |
| `NSPrivacyAccessedAPICategoryUserDefaults` | `CA92.1` | plugin and app preferences stored in the app's own defaults |

To audit on macOS: build, then use Xcode's privacy report
(Product > Archive > Generate Privacy Report) and compare it with this table.
There is no macOS in the development container, so this check is manual or CI.

### Android data safety

- [ ] The Play Console data safety form matches the app: no data collected, no data shared, no network access.
- [ ] `android/app/src/main/AndroidManifest.xml` still declares no `INTERNET` permission.
- [ ] A new dependency that adds analytics, ads or network access is rejected.

## Size budget

- [ ] Arm64 release APK is under 15 MB.
- [ ] Universal release APK is under 25 MB.
- [ ] AAB is under 20 MB.
- [ ] Any asset over 100 KB is referenced by the app; unreferenced assets are deleted.

Record the measured sizes in `RELEASES.md`.

## Smoke test

- [ ] Launch, create a list, add items, complete one, swipe to delete.
- [ ] Pin, reorder, rename and delete a list.
- [ ] Change theme and language, restart, and confirm both persisted with the data.
- [ ] Reduce motion is respected and text scaling does not clip.
