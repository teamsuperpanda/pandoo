// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class AppLocalizationsMn extends AppLocalizations {
  AppLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get appTitle => 'Пандоо';

  @override
  String get renameList => 'Жагсаалтын Нэрийг Өөрчлөх';

  @override
  String get listName => 'Жагсаалтын Нэр';

  @override
  String get cancel => 'Цуцлах';

  @override
  String get rename => 'Нэр Өөрчлөх';

  @override
  String get delete => 'Устгах';

  @override
  String get deleteList => 'Жагсаалт Устгах';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\"-г устгахдаа итгэлтэй байна уу?';
  }

  @override
  String get cleanCompleted => 'Дууссан Зүйлсийг Цэвэрлэх';

  @override
  String get cleanConfirmation =>
      'Энэ жагсаалтаас бүх дууссан зүйлсийг хасах уу?';

  @override
  String get clean => 'Цэвэрлэх';

  @override
  String itemsCount(Object count) {
    return '$count зүйл';
  }

  @override
  String get settings => 'Тохиргоо';

  @override
  String get theme => 'Загвар';

  @override
  String get system => 'Систем';

  @override
  String get light => 'Цайвар';

  @override
  String get dark => 'Бараан';

  @override
  String get close => 'Хаах';

  @override
  String get listExists => 'Жагсаалт Аль Хэдийн Байна';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' аль хэдийн байна';
  }

  @override
  String get addNewList => 'Шинэ жагсаалт нэмэх...';

  @override
  String get addNewItem => 'Шинэ зүйл нэмэх...';

  @override
  String get language => 'Хэл';

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
