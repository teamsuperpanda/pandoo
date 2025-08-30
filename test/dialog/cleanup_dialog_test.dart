import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/dialog/cleanup_dialog.dart';

void main() {
  group('CleanupDialog', () {
    testWidgets('CleanupDialog can be instantiated', (tester) async {
      expect(() => CleanupDialog(), returnsNormally);
    });
  });
}
