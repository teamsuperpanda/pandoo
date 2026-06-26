// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Macedonian (`mk`).
class AppLocalizationsMk extends AppLocalizations {
  AppLocalizationsMk([String locale = 'mk']) : super(locale);

  @override
  String get appTitle => 'Пандо';

  @override
  String get renameList => 'Преименувај Листа';

  @override
  String get listName => 'Име на Листа';

  @override
  String get cancel => 'Откажи';

  @override
  String get rename => 'Преименувај';

  @override
  String get delete => 'Избриши';

  @override
  String get deleteList => 'Избриши Листа';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Дали сте сигурни дека сакате да ја избришете \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Исчисти Завршени Ставки';

  @override
  String get cleanConfirmation =>
      'Отстрани ги сите завршени ставки од оваа листа?';

  @override
  String get clean => 'Исчисти';

  @override
  String itemsCount(Object count) {
    return '$count ставки';
  }

  @override
  String get settings => 'Поставки';

  @override
  String get theme => 'Тема';

  @override
  String get system => 'Систем';

  @override
  String get light => 'Светла';

  @override
  String get dark => 'Темна';

  @override
  String get close => 'Затвори';

  @override
  String get listExists => 'Листата Веќе Постои';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' веќе постои';
  }

  @override
  String get addNewList => 'Додај нова листа...';

  @override
  String get addNewItem => 'Додај нова ставка...';

  @override
  String get language => 'Јазик';

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
