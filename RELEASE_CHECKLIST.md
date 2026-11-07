# Release Checklist

Run through this list for every release.

## Version and toolchain

- [ ] `pubspec.yaml` version is bumped (version name and build number).
- [ ] The tag matches the pubspec version (`v2.5.0+14` style) and CI rejects a mismatch.
- [ ] `RELEASES.md` has a row with the Flutter and Dart versions used.
- [ ] `release_notes.json` is updated and every changelog file matches the build number.

## Build and signing

- [ ] Release signing is configured from secrets or `android/key.properties`; the build fails without it.
- [ ] No keystore, password or `key.properties` is committed.
- [ ] CI produced the AAB and APK artifacts, and they are attached to the release.

## Privacy and platform

- [ ] `ios/Runner/PrivacyInfo.xcprivacy` still lists only the required-reason APIs the app calls.
- [ ] The Android data-safety form matches what the app actually stores and shares (nothing shared, no network).
- [ ] `SECURITY.md` and the threat model still match the shipped app.

## Size budget

Record APK and AAB sizes and keep the release build under budget.

- [ ] Arm64 release APK is under 15 MB.
- [ ] Universal release APK is under 25 MB.
- [ ] AAB is under 20 MB.
- [ ] Any asset over 100 KB is referenced by the app; unreferenced assets are deleted.

Record the measured sizes next to the release in `RELEASES.md` notes.

## Smoke test

- [ ] Launch, create a list, add items, complete one, swipe to delete.
- [ ] Pin, reorder, rename and delete a list.
- [ ] Change theme and language, restart, and confirm both persisted with the data.
- [ ] Reduce motion is respected and text scaling does not clip.
