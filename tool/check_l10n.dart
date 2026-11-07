// SPDX-FileCopyrightText: 2026 Team Super Panda
// SPDX-License-Identifier: MIT

// Fails when a new English string is added without a translation.
//
// Flutter writes lib/l10n/untranslated.json during `flutter gen-l10n`. The
// committed tool/l10n_baseline.json records the gaps that already existed when
// the gate was introduced. Any new (locale, key) pair fails CI. Removing a gap
// from the baseline is encouraged; adding one is not.

import 'dart:convert';
import 'dart:io';

void main() {
  final current = _readMap('lib/l10n/untranslated.json');
  final baseline = _readMap('tool/l10n_baseline.json');

  final failures = <String>[];
  current.forEach((locale, keys) {
    final allowed = baseline[locale] ?? const <String>[];
    for (final key in keys) {
      if (!allowed.contains(key)) {
        failures.add('$locale is missing "$key"');
      }
    }
  });

  if (failures.isEmpty) {
    stdout.writeln('l10n gate: no new untranslated keys');
    return;
  }
  stderr.writeln('l10n gate: ${failures.length} new untranslated key(s)');
  for (final failure in failures) {
    stderr.writeln('  - $failure');
  }
  stderr.writeln(
    'Add the translation to the ARB file, or document why the English '
    'fallback is acceptable and update tool/l10n_baseline.json.',
  );
  exitCode = 1;
}

Map<String, List<String>> _readMap(String path) {
  final file = File(path);
  if (!file.existsSync()) {
    stderr.writeln('l10n gate: missing $path (run flutter gen-l10n)');
    exit(1);
  }
  final decoded = jsonDecode(file.readAsStringSync());
  if (decoded is! Map) {
    stderr.writeln('l10n gate: $path is not a JSON object');
    exit(1);
  }
  return {
    for (final entry in decoded.entries)
      entry.key as String: (entry.value as List).cast<String>(),
  };
}
