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

  @override
  String get reorderList => 'Reorder list';

  @override
  String get pinnedList => 'Pinned list';

  @override
  String get moreOptions => 'More options';

  @override
  String get startupErrorTitle => 'Local storage could not be opened';

  @override
  String get startupErrorMessage =>
      'Your data is still on this device. Retry first. If retrying keeps failing, copy the diagnostics or reset local data as a last resort.';

  @override
  String get retry => 'Retry';

  @override
  String get copyDiagnostics => 'Copy diagnostics';

  @override
  String get diagnosticsCopied => 'Diagnostics copied';

  @override
  String get resetLocalData => 'Reset local data';

  @override
  String get resetConfirmTitle => 'Reset local data?';

  @override
  String get resetConfirmMessage =>
      'This deletes every list and setting on this device and cannot be undone. Copy the diagnostics first if you want help recovering the data.';
}
