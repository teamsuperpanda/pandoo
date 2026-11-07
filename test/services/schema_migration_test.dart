import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/services/schema_migration.dart';

void main() {
  test('walks versions in order and persists each one', () async {
    final order = <int>[];
    final persisted = <int>[];

    final reached = await runSchemaMigrations(
      fromVersion: 0,
      targetVersion: 3,
      migrations: {
        1: () async => order.add(1),
        2: () async => order.add(2),
        3: () async => order.add(3),
      },
      persistVersion: (version) async => persisted.add(version),
    );

    expect(reached, 3);
    expect(order, [1, 2, 3]);
    expect(persisted, [1, 2, 3]);
  });

  test('is idempotent when already at the target version', () async {
    var calls = 0;

    final reached = await runSchemaMigrations(
      fromVersion: 3,
      targetVersion: 3,
      migrations: {3: () async => calls++},
      persistVersion: (_) async => calls++,
    );

    expect(reached, 3);
    expect(calls, 0);
  });

  test('a failing migration does not advance the version', () async {
    final persisted = <int>[];

    await expectLater(
      runSchemaMigrations(
        fromVersion: 0,
        targetVersion: 2,
        migrations: {
          1: () async {},
          2: () async => throw StateError('migration failed'),
        },
        persistVersion: (version) async => persisted.add(version),
      ),
      throwsStateError,
    );

    expect(persisted, [1]);
  });

  test('refuses to run a missing version', () async {
    await expectLater(
      runSchemaMigrations(
        fromVersion: 0,
        targetVersion: 2,
        migrations: {1: () async {}},
        persistVersion: (_) async {},
      ),
      throwsStateError,
    );
  });

  test('does not downgrade a newer stored version', () async {
    final reached = await runSchemaMigrations(
      fromVersion: 5,
      targetVersion: 3,
      migrations: const {},
      persistVersion: (_) async => fail('must not persist'),
    );

    expect(reached, 5);
  });
}
