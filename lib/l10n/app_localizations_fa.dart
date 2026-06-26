// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'پاندو';

  @override
  String get renameList => 'تغییر نام لیست';

  @override
  String get listName => 'نام لیست';

  @override
  String get cancel => 'لغو';

  @override
  String get rename => 'تغییر نام';

  @override
  String get delete => 'حذف';

  @override
  String get deleteList => 'حذف لیست';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'آیا مطمئن هستید که می‌خواهید \"$listTitle\" را حذف کنید؟';
  }

  @override
  String get cleanCompleted => 'پاک کردن موارد تکمیل شده';

  @override
  String get cleanConfirmation => 'همه موارد تکمیل شده از این لیست حذف شوند؟';

  @override
  String get clean => 'پاک کردن';

  @override
  String itemsCount(Object count) {
    return '$count مورد';
  }

  @override
  String get settings => 'تنظیمات';

  @override
  String get theme => 'تم';

  @override
  String get system => 'سیستم';

  @override
  String get light => 'روشن';

  @override
  String get dark => 'تاریک';

  @override
  String get close => 'بستن';

  @override
  String get listExists => 'لیست از قبل وجود دارد';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' از قبل وجود دارد';
  }

  @override
  String get addNewList => 'افزودن لیست جدید...';

  @override
  String get addNewItem => 'افزودن مورد جدید...';

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
