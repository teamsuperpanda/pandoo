import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/main.dart';
import 'package:pandoo/services/umami_service.dart';

void main() {
  group('Main App', () {
    testWidgets('MyApp can be instantiated', (tester) async {
      expect(
        () => MyApp(
          umamiService: UmamiService(
            websiteId: 'test',
            endpoint: 'https://example.com',
          ),
        ),
        returnsNormally,
      );
    });

    testWidgets('app has correct title property', (tester) async {
      final app = MyApp(
        umamiService: UmamiService(
          websiteId: 'test',
          endpoint: 'https://example.com',
        ),
      );
      expect(app, isA<MyApp>());
    });
  });
}
