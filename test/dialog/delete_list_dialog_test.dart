import 'package:flutter_test/flutter_test.dart';
import 'package:pandoo/dialog/delete_list_dialog.dart';

void main() {
  group('DeleteListDialog', () {
    testWidgets('DeleteListDialog can be instantiated', (tester) async {
      expect(() => DeleteListDialog(
        listTitle: 'Test List',
      ), returnsNormally);
    });

    testWidgets('has correct list name property', (tester) async {
      final dialog = DeleteListDialog(
        listTitle: 'My Test List',
      );
      
      expect(dialog.listTitle, equals('My Test List'));
    });
  });
}
