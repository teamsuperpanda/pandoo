// SPDX-FileCopyrightText: 2026 Team Super Panda
// SPDX-License-Identifier: MIT

// Generates store changelogs from release_notes.json.
//
// Run after bumping the version in pubspec.yaml:
//
//   dart run tool/generate_changelogs.dart
//
// Writes:
//   android/fastlane/metadata/android/<play-locale>/changelogs/<versionCode>.txt
//   ios/fastlane/metadata/<ios-locale>/release_notes.txt
//
// With --check it writes nothing and fails if the newest Play changelog is
// missing or does not match release_notes.json. CI runs this on every PR.

import 'dart:convert';
import 'dart:io';

/// release_notes.json language -> Play metadata folder.
const Map<String, String> playLocales = {
  'en-US': 'en-US',
  'en-GB': 'en-GB',
  'es-ES': 'es-ES',
  'es-MX': 'es-419',
  'fr-FR': 'fr-FR',
  'de-DE': 'de-DE',
  'pt-BR': 'pt-BR',
  'pt-PT': 'pt-PT',
  'it': 'it-IT',
  'ja': 'ja-JP',
  'ko': 'ko-KR',
  'zh-Hans': 'zh-CN',
  'zh-Hant': 'zh-TW',
  'ru': 'ru-RU',
  'tr': 'tr-TR',
  'nl-NL': 'nl-NL',
  'sv': 'sv-SE',
  'pl': 'pl-PL',
  'ar-SA': 'ar',
  'hi': 'hi-IN',
  'id': 'id',
  'vi': 'vi',
};

/// release_notes.json language -> iOS metadata folder.
const Map<String, String> iosLocales = {
  'en-US': 'en-US',
  'en-GB': 'en-GB',
  'es-ES': 'es-ES',
  'es-MX': 'es-MX',
  'fr-FR': 'fr-FR',
  'de-DE': 'de-DE',
  'pt-BR': 'pt-BR',
  'pt-PT': 'pt-PT',
  'it': 'it',
  'ja': 'ja',
  'ko': 'ko',
  'zh-Hans': 'zh-Hans',
  'zh-Hant': 'zh-Hant',
  'ru': 'ru',
  'tr': 'tr',
  'nl-NL': 'nl-NL',
  'sv': 'sv',
  'pl': 'pl',
  'ar-SA': 'ar-SA',
  'hi': 'hi',
  'id': 'id',
  'vi': 'vi',
};

void main(List<String> args) {
  final check = args.contains('--check');
  final version = _pubspecVersion();
  final notes = _readNotes();
  final playDir = 'android/fastlane/metadata/android';
  final iosDir = 'ios/fastlane/metadata';
  final errors = <String>[];
  var written = 0;

  for (final entry in notes.entries) {
    final playLocale = playLocales[entry.key];
    final iosLocale = iosLocales[entry.key];
    if (playLocale == null || iosLocale == null) {
      errors.add('No locale mapping for ${entry.key}');
      continue;
    }
    final playFile =
        File('$playDir/$playLocale/changelogs/${version.build}.txt');
    final iosFile = File('$iosDir/$iosLocale/release_notes.txt');

    if (check) {
      if (!playFile.existsSync()) {
        errors.add('Missing ${playFile.path}');
      } else if (playFile.readAsStringSync().trim() != entry.value.trim()) {
        errors.add('Stale ${playFile.path}');
      }
      continue;
    }

    playFile.parent.createSync(recursive: true);
    playFile.writeAsStringSync('${entry.value.trim()}\n');
    iosFile.parent.createSync(recursive: true);
    iosFile.writeAsStringSync('${entry.value.trim()}\n');
    written++;
  }

  if (errors.isNotEmpty) {
    stderr.writeln('release notes: ${errors.length} problem(s)');
    for (final error in errors) {
      stderr.writeln('  - $error');
    }
    exitCode = 1;
    return;
  }
  stdout.writeln(
    check
        ? 'release notes: OK for build ${version.build}'
        : 'release notes: wrote $written locales for build ${version.build}',
  );
}

({String name, String build}) _pubspecVersion() {
  final line = File('pubspec.yaml')
      .readAsLinesSync()
      .firstWhere((line) => line.startsWith('version:'));
  final raw = line.substring('version:'.length).trim();
  final plus = raw.indexOf('+');
  if (plus == -1) {
    stderr.writeln('pubspec version must include a build number: $raw');
    exit(1);
  }
  return (name: raw.substring(0, plus), build: raw.substring(plus + 1));
}

Map<String, String> _readNotes() {
  final decoded = jsonDecode(File('release_notes.json').readAsStringSync());
  if (decoded is! List) {
    stderr.writeln('release_notes.json must be a list');
    exit(1);
  }
  final notes = <String, String>{};
  for (final item in decoded) {
    if (item is! Map || item['language'] is! String || item['text'] is! String) {
      stderr.writeln('release_notes.json entry is invalid: $item');
      exit(1);
    }
    notes[item['language'] as String] = item['text'] as String;
  }
  return notes;
}
