import 'package:flutter/foundation.dart';

/// Current on-disk schema version.
///
/// Bump this whenever `ListModel`, `TodoItem` or `Settings` changes in a way
/// that needs code to run before the first read. Add the matching entry to
/// [schemaMigrations] and a test that walks the previous version forward.
const int currentSchemaVersion = 1;

typedef SchemaMigration = Future<void> Function();

/// Ordered, idempotent migrations keyed by the version they produce.
///
/// Version 1 is the baseline: existing name-keyed boxes need no rewrite yet.
final Map<int, SchemaMigration> schemaMigrations = {1: () async {}};

/// Runs every migration from [fromVersion] up to [targetVersion].
///
/// A migration only advances the stored version after it completes, so a
/// failure leaves the previous version in place and is safe to retry.
/// Returns the version reached.
Future<int> runSchemaMigrations({
  required int fromVersion,
  required int targetVersion,
  required Map<int, SchemaMigration> migrations,
  required Future<void> Function(int version) persistVersion,
}) async {
  if (fromVersion > targetVersion) {
    debugPrint(
      'Schema version $fromVersion is newer than the app ($targetVersion); '
      'skipping migrations.',
    );
    return fromVersion;
  }

  var version = fromVersion;
  for (var next = version + 1; next <= targetVersion; next++) {
    final migration = migrations[next];
    if (migration == null) {
      throw StateError('Missing migration to schema version $next');
    }
    await migration();
    await persistVersion(next);
    version = next;
  }
  return version;
}
