// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get appTitle => 'پاندو';

  @override
  String get renameList => 'فہرست کا نام تبدیل کریں';

  @override
  String get listName => 'فہرست کا نام';

  @override
  String get cancel => 'منسوخ کریں';

  @override
  String get rename => 'نام تبدیل کریں';

  @override
  String get delete => 'حذف کریں';

  @override
  String get deleteList => 'فہرست حذف کریں';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'کیا آپ واقعی \"$listTitle\" کو حذف کرنا چاہتے ہیں؟';
  }

  @override
  String get cleanCompleted => 'مکمل شدہ آئٹمز صاف کریں';

  @override
  String get cleanConfirmation => 'اس فہرست سے تمام مکمل شدہ آئٹمز کو ہٹا دیں؟';

  @override
  String get clean => 'صاف کریں';

  @override
  String itemsCount(Object count) {
    return '$count آئٹمز';
  }

  @override
  String get settings => 'ترتیبات';

  @override
  String get theme => 'تھیم';

  @override
  String get system => 'سسٹم';

  @override
  String get light => 'روشن';

  @override
  String get dark => 'تاریک';

  @override
  String get close => 'بند کریں';

  @override
  String get listExists => 'فہرست پہلے سے موجود ہے';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' پہلے سے موجود ہے';
  }

  @override
  String get addNewList => 'نئی فہرست شامل کریں...';

  @override
  String get addNewItem => 'نیا آئٹم شامل کریں...';

  @override
  String get language => 'زبان';

  @override
  String get nameCannotBeEmpty => 'Name cannot be empty';

  @override
  String get pin => 'Pin';

  @override
  String get unpin => 'Unpin';

  @override
  String get animateAddButton => 'Animation';

  @override
  String get searchItems => 'Search items...';

  @override
  String completedItemLabel(Object title) {
    return 'Completed: $title';
  }

  @override
  String incompleteItemLabel(Object title) {
    return 'Incomplete: $title';
  }
}
