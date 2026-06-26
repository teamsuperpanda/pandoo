// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'باندو';

  @override
  String get renameList => 'إعادة تسمية القائمة';

  @override
  String get listName => 'اسم القائمة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get rename => 'إعادة تسمية';

  @override
  String get delete => 'حذف';

  @override
  String get deleteList => 'حذف القائمة';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'هل أنت متأكد أنك تريد حذف \"$listTitle\"؟';
  }

  @override
  String get cleanCompleted => 'تنظيف العناصر المكتملة';

  @override
  String get cleanConfirmation => 'إزالة جميع العناصر المكتملة من هذه القائمة؟';

  @override
  String get clean => 'تنظيف';

  @override
  String itemsCount(Object count) {
    return '$count عنصر';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get theme => 'المظهر';

  @override
  String get system => 'النظام';

  @override
  String get light => 'فاتح';

  @override
  String get dark => 'داكن';

  @override
  String get close => 'إغلاق';

  @override
  String get listExists => 'القائمة موجودة بالفعل';

  @override
  String listExistsMessage(Object name) {
    return 'القائمة \'$name\' موجودة بالفعل';
  }

  @override
  String get addNewList => 'إضافة قائمة جديدة...';

  @override
  String get addNewItem => 'إضافة عنصر جديد...';

  @override
  String get language => 'اللغة';

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
