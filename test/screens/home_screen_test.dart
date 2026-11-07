import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/models/locale_adapter.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/models/theme_mode_adapter.dart';
import 'package:pandoo/screens/home_screen.dart';
import 'package:pandoo/services/settings_service.dart';

import '../helpers/test_helpers.dart';
import '../helpers/widget_wrapper.dart';

void main() {
  group('HomeScreen motion', () {
    Directory? hiveDir;

    setUpAll(() async {
      hiveDir = await initializeHiveForTesting();
      if (!Hive.isAdapterRegistered(2)) {
        Hive.registerAdapter(SettingsAdapter());
      }
      if (!Hive.isAdapterRegistered(100)) {
        Hive.registerAdapter(ThemeModeAdapter());
      }
      if (!Hive.isAdapterRegistered(101)) {
        Hive.registerAdapter(LocaleAdapter());
      }
    });

    setUp(() async {
      if (Hive.isBoxOpen('settings_db')) {
        await Hive.box<Settings>('settings_db').close();
      }
      await Hive.deleteBoxFromDisk('settings_db');
      final box = await Hive.openBox<Settings>('settings_db');
      SettingsService.setTestInstance(box);
    });

    tearDownAll(() async {
      await Hive.close();
      hiveDir?.deleteSync(recursive: true);
    });

    testWidgets('does not animate the FAB when animations are disabled', (
      tester,
    ) async {
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(
        tester.platformDispatcher.clearAccessibilityFeaturesTestValue,
      );

      await tester.pumpWidget(wrapWithMaterialApp(const HomeScreen()));
      await tester.pump();

      final before = _fabTransform(tester);
      await tester.pump(const Duration(milliseconds: 600));
      final after = _fabTransform(tester);

      expect(after, before);
    });

    testWidgets('ignores the logo rotation when animations are disabled', (
      tester,
    ) async {
      tester.platformDispatcher.accessibilityFeaturesTestValue =
          const FakeAccessibilityFeatures(disableAnimations: true);
      addTearDown(
        tester.platformDispatcher.clearAccessibilityFeaturesTestValue,
      );

      await tester.pumpWidget(wrapWithMaterialApp(const HomeScreen()));
      await tester.pump();

      final before = tester
          .widget<RotationTransition>(find.byType(RotationTransition).first)
          .turns
          .value;
      await tester.tap(find.byType(IconButton).first);
      await tester.pump(const Duration(milliseconds: 600));
      final after = tester
          .widget<RotationTransition>(find.byType(RotationTransition).first)
          .turns
          .value;

      expect(after, before);
    });
  });
}

Matrix4 _fabTransform(WidgetTester tester) {
  final transform = tester.widget<Transform>(
    find
        .ancestor(
          of: find.byType(FloatingActionButton),
          matching: find.byType(Transform),
        )
        .first,
  );
  return transform.transform;
}
