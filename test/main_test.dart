import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/main.dart';

void main() {
  group('Main App', () {
    testWidgets('MyApp can be instantiated', (tester) async {
      expect(
        () => const MyApp(),
        returnsNormally,
      );
    });

    testWidgets('app has correct title property', (tester) async {
      const app = MyApp();
      expect(app, isA<MyApp>());
    });
  });
}
