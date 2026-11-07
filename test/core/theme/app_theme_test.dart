import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/core/theme/app_theme.dart';

void main() {
  test('light theme icons contrast with light surfaces', () {
    final theme = AppTheme.light();
    expect(theme.iconTheme.color, theme.colorScheme.onSurface);
    expect(theme.iconTheme.color, isNot(Colors.white));
  });

  test('dark theme icons use the dark onSurface color', () {
    final theme = AppTheme.dark();
    expect(theme.iconTheme.color, theme.colorScheme.onSurface);
  });

  testWidgets(
    'search and dropdown icons resolve to the light onSurface color',
    (tester) async {
      final theme = AppTheme.light();
      await tester.pumpWidget(
        MaterialApp(
          theme: theme,
          home: Scaffold(
            body: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(prefixIcon: Icon(Icons.search)),
                ),
                DropdownButtonFormField<String>(
                  items: const [DropdownMenuItem(value: 'a', child: Text('A'))],
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
        ),
      );

      final searchIcon = tester.widget<Icon>(find.byIcon(Icons.search));
      expect(searchIcon.color, isNull);
      expect(theme.iconTheme.color, theme.colorScheme.onSurface);
    },
  );
}
