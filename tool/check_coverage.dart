// SPDX-FileCopyrightText: 2026 Team Super Panda
// SPDX-License-Identifier: MIT

// Enforces a line-coverage floor from coverage/lcov.info.
//
// Run `flutter test --coverage` first. The threshold is deliberately below the
// current value so it ratchets progress without blocking unrelated work; raise
// it when coverage improves.

import 'dart:io';

const double threshold = 10;

void main() {
  final file = File('coverage/lcov.info');
  if (!file.existsSync()) {
    stderr.writeln('coverage: coverage/lcov.info not found');
    exit(1);
  }

  var found = 0;
  var hit = 0;
  for (final line in file.readAsLinesSync()) {
    if (line.startsWith('LF:')) {
      found += int.parse(line.substring(3));
    } else if (line.startsWith('LH:')) {
      hit += int.parse(line.substring(3));
    }
  }

  if (found == 0) {
    stderr.writeln('coverage: no lines found in lcov.info');
    exit(1);
  }
  final percent = hit / found * 100;
  stdout.writeln('coverage: ${percent.toStringAsFixed(1)}% ($hit/$found)');
  if (percent < threshold) {
    stderr.writeln(
      'coverage: below the ${threshold.toStringAsFixed(0)}% floor',
    );
    exitCode = 1;
  }
}
