// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get appTitle => 'แพนดู';

  @override
  String get renameList => 'เปลี่ยนชื่อรายการ';

  @override
  String get listName => 'ชื่อรายการ';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get rename => 'เปลี่ยนชื่อ';

  @override
  String get delete => 'ลบ';

  @override
  String get deleteList => 'ลบรายการ';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'ล้างรายการที่เสร็จสิ้น';

  @override
  String get cleanConfirmation => 'ลบรายการที่เสร็จสิ้นทั้งหมดจากรายการนี้?';

  @override
  String get clean => 'ล้าง';

  @override
  String itemsCount(Object count) {
    return '$count รายการ';
  }

  @override
  String get settings => 'การตั้งค่า';

  @override
  String get theme => 'ธีม';

  @override
  String get system => 'ระบบ';

  @override
  String get light => 'สว่าง';

  @override
  String get dark => 'มืด';

  @override
  String get close => 'ปิด';

  @override
  String get listExists => 'มีรายการนี้อยู่แล้ว';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' มีอยู่แล้ว';
  }

  @override
  String get addNewList => 'เพิ่มรายการใหม่...';

  @override
  String get addNewItem => 'เพิ่มรายการใหม่...';

  @override
  String get language => 'ภาษา';

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
