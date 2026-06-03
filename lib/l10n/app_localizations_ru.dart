// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Пандо';

  @override
  String get renameList => 'Переименовать Список';

  @override
  String get listName => 'Название Списка';

  @override
  String get cancel => 'Отмена';

  @override
  String get rename => 'Переименовать';

  @override
  String get delete => 'Удалить';

  @override
  String get deleteList => 'Удалить Список';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Вы уверены, что хотите удалить \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Очистить Завершенные Элементы';

  @override
  String get cleanConfirmation =>
      'Удалить все завершенные элементы из этого списка?';

  @override
  String get clean => 'Очистить';

  @override
  String itemsCount(Object count) {
    return '$count элементов';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get theme => 'Тема';

  @override
  String get system => 'Система';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Темная';

  @override
  String get close => 'Закрыть';

  @override
  String get listExists => 'Список Уже Существует';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' уже существует';
  }

  @override
  String get addNewList => 'Добавить новый список...';

  @override
  String get addNewItem => 'Добавить новый элемент...';

  @override
  String get language => 'Язык';

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
