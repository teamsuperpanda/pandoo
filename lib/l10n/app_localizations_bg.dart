// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bulgarian (`bg`).
class AppLocalizationsBg extends AppLocalizations {
  AppLocalizationsBg([String locale = 'bg']) : super(locale);

  @override
  String get appTitle => 'Пандо';

  @override
  String get renameList => 'Преименувай Списък';

  @override
  String get listName => 'Име на Списък';

  @override
  String get cancel => 'Отказ';

  @override
  String get rename => 'Преименувай';

  @override
  String get delete => 'Изтрий';

  @override
  String get deleteList => 'Изтрий Списък';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Сигурни ли сте, че искате да изтриете \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Изчисти Завършените Елементи';

  @override
  String get cleanConfirmation =>
      'Премахване на всички завършени елементи от този списък?';

  @override
  String get clean => 'Изчисти';

  @override
  String itemsCount(Object count) {
    return '$count елемента';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get theme => 'Тема';

  @override
  String get system => 'Система';

  @override
  String get light => 'Светла';

  @override
  String get dark => 'Тъмна';

  @override
  String get close => 'Затвори';

  @override
  String get listExists => 'Списъкът Вече Съществува';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' вече съществува';
  }

  @override
  String get addNewList => 'Добави нов списък...';

  @override
  String get addNewItem => 'Добави нов елемент...';

  @override
  String get language => 'Език';

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
