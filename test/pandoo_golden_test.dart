import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:pandoo/core/theme/app_theme.dart';
import 'package:pandoo/l10n/app_localizations.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/models/locale_adapter.dart';
import 'package:pandoo/models/settings_model.dart';
import 'package:pandoo/models/theme_mode_adapter.dart';
import 'package:pandoo/screens/detail.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/services/storage_service.dart';

import 'store_frame.dart';
import 'widgets/helpers/mock_box.dart';

class _DeviceConfig {
  const _DeviceConfig(this.size, this.dpr);
  final Size size;
  final double dpr;
}

final _devices = <String, _DeviceConfig>{
  'android': const _DeviceConfig(Size(412, 915), 3),
  'iphone_6.5': const _DeviceConfig(Size(414, 896), 3),
  'iphone_6.9': const _DeviceConfig(Size(440, 956), 3),
  'ipad_12.9': const _DeviceConfig(Size(1024, 1366), 2),
  'ipad_13': const _DeviceConfig(Size(1032, 1376), 2),
};

const _goldenDir = 'golden';

Widget _buildMockHomeScreen({
  required ThemeMode themeMode,
  required MockBox mockBox,
}) {
  final theme = themeMode == ThemeMode.dark ? AppTheme.dark() : AppTheme.light();
  final lists = mockBox.values.toList();
  final pinned = lists.where((l) => l.pinned).toList()..sort((a, b) => a.order.compareTo(b.order));
  final unpinned = lists.where((l) => !l.pinned).toList()..sort((a, b) => a.order.compareTo(b.order));
  final sorted = [...pinned, ...unpinned];

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Pandoo',
    theme: AppTheme.light(),
    darkTheme: AppTheme.dark(),
    themeMode: themeMode,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset(
            'assets/images/icon/icon.png',
            height: 36,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Pandoo',
          style: theme.appBarTheme.titleTextStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: Icon(Icons.settings, color: theme.appBarTheme.foregroundColor),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              children: [
                for (final list in sorted) _MockListCard(
                  title: list.name,
                  pinned: list.pinned,
                  itemCount: list.items.length,
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: FloatingActionButton(
              onPressed: () {},
              elevation: 0,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    ),
  );
}

const _homeScreenGradient = [Color(0xFF1B5E20), Color(0xFF43A047), Color(0xFF66BB6A)];
const _homeScreenDarkGradient = [Color(0xFF0D3310), Color(0xFF1B5E20), Color(0xFF388E3C)];
const _detailGradient = [Color(0xFF004D40), Color(0xFF00897B), Color(0xFF26A69A)];
const _detailDarkGradient = [Color(0xFF002020), Color(0xFF004D40), Color(0xFF00695C)];

const _storeTagline = 'Your lists, organized.';

class _MockListCard extends StatelessWidget {
  const _MockListCard({
    required this.title,
    required this.pinned,
    required this.itemCount,
  });

  final String title;
  final bool pinned;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: theme.colorScheme.surface,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                pinned ? Icons.push_pin : Icons.drag_indicator,
                color: theme.colorScheme.onSurface.withAlpha(128),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        itemCount.toString(),
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.more_vert, color: theme.colorScheme.onSurface.withAlpha(128)),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> _populateMockData(MockBox mockBox) async {
  await mockBox.put(
    'Coding',
    MockBox.createMockList('Coding', 0, pinned: true, items: [
      TodoItem(text: 'Refactor auth'),
      TodoItem(text: 'Add unit tests'),
      TodoItem(text: 'Update API docs'),
    ]),
  );

  await mockBox.put(
    'Groceries',
    MockBox.createMockList('Groceries', 1, pinned: true, items: [
      TodoItem(text: 'Milk'),
      TodoItem(text: 'Eggs'),
      TodoItem(text: 'Bread'),
      TodoItem(text: 'Bananas'),
      TodoItem(text: 'Coffee'),
    ]),
  );

  await mockBox.put(
    'Presents',
    MockBox.createMockList('Presents', 2, items: [
      TodoItem(text: 'Birthday gift for Mom'),
      TodoItem(text: 'Anniversary gift'),
    ]),
  );

  await mockBox.put(
    'Reading',
    MockBox.createMockList('Reading', 3, items: [
      TodoItem(text: 'Clean Code'),
      TodoItem(text: 'The Pragmatic Programmer'),
    ]),
  );

  await mockBox.put(
    'Workout',
    MockBox.createMockList('Workout', 4, items: [
      TodoItem(text: 'Chest day'),
      TodoItem(text: 'Back day'),
      TodoItem(text: 'Leg day'),
      TodoItem(text: 'Shoulder day'),
    ]),
  );
}

Future<void> _initSettingsService() async {
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(SettingsAdapter());
  }
  if (!Hive.isAdapterRegistered(100)) {
    Hive.registerAdapter(ThemeModeAdapter());
  }
  if (!Hive.isAdapterRegistered(101)) {
    Hive.registerAdapter(LocaleAdapter());
  }

  Hive.init('test');
  final settingsBox = await Hive.openBox<Settings>('settings_db_golden');
  await settingsBox.put(
    'app_settings',
    Settings(fabAnimation: false),
  );
  SettingsService.setTestInstance(settingsBox);
}

void main() {
  for (final entry in _devices.entries) {
    final deviceName = entry.key;
    final config = entry.value;

    group('Golden $deviceName', () {
      late MockBox mockBox;

      setUp(() async {
        mockBox = MockBox();
        StorageService.setTestInstance(mockBox);
        await _initSettingsService();
      });

      Future<void> setViewport(WidgetTester tester) async {
        tester.view.physicalSize = config.size * config.dpr;
        tester.view.devicePixelRatio = config.dpr;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });
      }

      testWidgets('home_screen', (tester) async {
        await _populateMockData(mockBox);
        await setViewport(tester);

        await tester.pumpWidget(
          _buildMockHomeScreen(themeMode: ThemeMode.light, mockBox: mockBox),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile('$_goldenDir/$deviceName/raw/home_screen.png'),
        );
      });

      testWidgets('home_screen_dark', (tester) async {
        await _populateMockData(mockBox);
        await setViewport(tester);

        await tester.pumpWidget(
          _buildMockHomeScreen(themeMode: ThemeMode.dark, mockBox: mockBox),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(Scaffold),
          matchesGoldenFile(
            '$_goldenDir/$deviceName/raw/home_screen_dark.png',
          ),
        );
      });

      testWidgets('detail', (tester) async {
        await _populateMockData(mockBox);
        await setViewport(tester);

        await tester.pumpWidget(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const DetailScreen(
              listTitle: 'Groceries',
            ),
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(DetailScreen),
          matchesGoldenFile('$_goldenDir/$deviceName/raw/detail.png'),
        );
      });

      testWidgets('detail_dark', (tester) async {
        await _populateMockData(mockBox);
        await setViewport(tester);

        await tester.pumpWidget(
          MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: ThemeMode.dark,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const DetailScreen(
              listTitle: 'Groceries',
            ),
          ),
        );
        await tester.pumpAndSettle();

        await expectLater(
          find.byType(DetailScreen),
          matchesGoldenFile('$_goldenDir/$deviceName/raw/detail_dark.png'),
        );
      });

      Future<void> pumpStore({
        required WidgetTester tester,
        required Widget child,
        required List<Color> gradientColors,
        required String label,
        String bottomTagline = '',
      }) async {
        await setViewport(tester);
        await tester.pumpWidget(StoreFrame(
          gradientColors: gradientColors,
          tagline: _storeTagline,
          bottomTagline: bottomTagline,
          child: child,
        ));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        await expectLater(
          find.byType(StoreFrame),
          matchesGoldenFile('$_goldenDir/$deviceName/store/$label.png'),
        );
      }

      testWidgets('store_home_screen', (tester) async {
        await _populateMockData(mockBox);
        await pumpStore(
          tester: tester,
          label: 'home_screen',
          gradientColors: _homeScreenGradient,
          bottomTagline: 'Organize Your Life',
          child: _buildMockHomeScreen(themeMode: ThemeMode.light, mockBox: mockBox),
        );
      });

      testWidgets('store_home_screen_dark', (tester) async {
        await _populateMockData(mockBox);
        await pumpStore(
          tester: tester,
          label: 'home_screen_dark',
          gradientColors: _homeScreenDarkGradient,
          bottomTagline: 'Stay on Track',
          child: _buildMockHomeScreen(themeMode: ThemeMode.dark, mockBox: mockBox),
        );
      });

      testWidgets('store_detail', (tester) async {
        await _populateMockData(mockBox);
        await pumpStore(
          tester: tester,
          label: 'detail',
          gradientColors: _detailGradient,
          bottomTagline: 'Check Off Your Tasks',
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const DetailScreen(
              listTitle: 'Groceries',
            ),
          ),
        );
      });

      testWidgets('store_detail_dark', (tester) async {
        await _populateMockData(mockBox);
        await pumpStore(
          tester: tester,
          label: 'detail_dark',
          gradientColors: _detailDarkGradient,
          bottomTagline: 'Get Things Done',
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: ThemeMode.dark,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            home: const DetailScreen(
              listTitle: 'Groceries',
            ),
          ),
        );
      });
    });
  }
}
