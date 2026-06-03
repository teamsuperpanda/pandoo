// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Đổi Tên Danh Sách';

  @override
  String get listName => 'Tên Danh Sách';

  @override
  String get cancel => 'Hủy';

  @override
  String get rename => 'Đổi Tên';

  @override
  String get delete => 'Xóa';

  @override
  String get deleteList => 'Xóa Danh Sách';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Bạn có chắc chắn muốn xóa \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Xóa Mục Đã Hoàn Thành';

  @override
  String get cleanConfirmation =>
      'Xóa tất cả các mục đã hoàn thành khỏi danh sách này?';

  @override
  String get clean => 'Xóa';

  @override
  String itemsCount(Object count) {
    return '$count mục';
  }

  @override
  String get settings => 'Cài Đặt';

  @override
  String get theme => 'Giao Diện';

  @override
  String get system => 'Hệ Thống';

  @override
  String get light => 'Sáng';

  @override
  String get dark => 'Tối';

  @override
  String get close => 'Đóng';

  @override
  String get listExists => 'Danh Sách Đã Tồn Tại';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' đã tồn tại';
  }

  @override
  String get addNewList => 'Thêm danh sách mới...';

  @override
  String get addNewItem => 'Thêm mục mới...';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get nameCannotBeEmpty => 'Name cannot be empty';

  @override
  String get pin => 'Pin';

  @override
  String get unpin => 'Unpin';

  @override
  String get analytics => 'Analytics';

  @override
  String get enableAnalytics => 'Enable Analytics';

  @override
  String get animateAddButton => 'Animation';
}
