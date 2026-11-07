import 'dart:async';

typedef StartupStep = Future<void> Function();

/// Runs the startup steps and returns a user-facing diagnostic on failure.
///
/// Returns null when startup succeeded. Never throws, so the caller can always
/// decide between the app and the recovery screen.
Future<String?> runStartup({
  required StartupStep storageInit,
  required StartupStep settingsInit,
}) async {
  try {
    await storageInit();
    await settingsInit();
    return null;
  } on Object catch (error, stackTrace) {
    return 'Pandoo could not open local storage.\n\n'
        'Error: $error\n\n'
        '${stackTrace.toString().split('\n').take(12).join('\n')}';
  }
}
