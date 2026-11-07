// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Lista Átnevezése';

  @override
  String get listName => 'Lista Neve';

  @override
  String get cancel => 'Mégse';

  @override
  String get rename => 'Átnevezés';

  @override
  String get delete => 'Törlés';

  @override
  String get deleteList => 'Lista Törlése';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Biztosan törölni szeretné a(z) \"$listTitle\"-t?';
  }

  @override
  String get cleanCompleted => 'Befejezett Elemek Törlése';

  @override
  String get cleanConfirmation =>
      'Törli az összes befejezett elemet ebből a listából?';

  @override
  String get clean => 'Törlés';

  @override
  String itemsCount(Object count) {
    return '$count elem';
  }

  @override
  String get settings => 'Beállítások';

  @override
  String get theme => 'Téma';

  @override
  String get system => 'Rendszer';

  @override
  String get light => 'Világos';

  @override
  String get dark => 'Sötét';

  @override
  String get close => 'Bezárás';

  @override
  String get listExists => 'A Lista Már Létezik';

  @override
  String listExistsMessage(Object name) {
    return 'A(z) \'$name\' már létezik';
  }

  @override
  String get addNewList => 'Új lista hozzáadása...';

  @override
  String get addNewItem => 'Új elem hozzáadása...';

  @override
  String get language => 'Nyelv';

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
