// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Zmień Nazwę Listy';

  @override
  String get listName => 'Nazwa Listy';

  @override
  String get cancel => 'Anuluj';

  @override
  String get rename => 'Zmień Nazwę';

  @override
  String get delete => 'Usuń';

  @override
  String get deleteList => 'Usuń Listę';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Czy na pewno chcesz usunąć \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Wyczyść Ukończone Elementy';

  @override
  String get cleanConfirmation =>
      'Usunąć wszystkie ukończone elementy z tej listy?';

  @override
  String get clean => 'Wyczyść';

  @override
  String itemsCount(Object count) {
    return '$count elementów';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get theme => 'Motyw';

  @override
  String get system => 'System';

  @override
  String get light => 'Jasny';

  @override
  String get dark => 'Ciemny';

  @override
  String get close => 'Zamknij';

  @override
  String get listExists => 'Lista Już Istnieje';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' już istnieje';
  }

  @override
  String get addNewList => 'Dodaj nową listę...';

  @override
  String get addNewItem => 'Dodaj nowy element...';

  @override
  String get language => 'Język';

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
