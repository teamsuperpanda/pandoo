// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get appTitle => 'Панду';

  @override
  String get renameList => 'Перейменувати Список';

  @override
  String get listName => 'Назва Списку';

  @override
  String get cancel => 'Скасувати';

  @override
  String get rename => 'Перейменувати';

  @override
  String get delete => 'Видалити';

  @override
  String get deleteList => 'Видалити Список';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Ви впевнені, що хочете видалити \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Очистити Завершені Елементи';

  @override
  String get cleanConfirmation =>
      'Видалити всі завершені елементи з цього списку?';

  @override
  String get clean => 'Очистити';

  @override
  String itemsCount(Object count) {
    return '$count елементів';
  }

  @override
  String get settings => 'Налаштування';

  @override
  String get theme => 'Тема';

  @override
  String get system => 'Система';

  @override
  String get light => 'Світла';

  @override
  String get dark => 'Темна';

  @override
  String get close => 'Закрити';

  @override
  String get listExists => 'Список Вже Існує';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' вже існує';
  }

  @override
  String get addNewList => 'Додати новий список...';

  @override
  String get addNewItem => 'Додати новий елемент...';

  @override
  String get language => 'Мова';
}
