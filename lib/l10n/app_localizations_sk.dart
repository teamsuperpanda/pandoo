// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Premenovať Zoznam';

  @override
  String get listName => 'Názov Zoznamu';

  @override
  String get cancel => 'Zrušiť';

  @override
  String get rename => 'Premenovať';

  @override
  String get delete => 'Vymazať';

  @override
  String get deleteList => 'Vymazať Zoznam';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Naozaj chcete vymazať \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Vyčistiť Dokončené Položky';

  @override
  String get cleanConfirmation =>
      'Odstrániť všetky dokončené položky z tohto zoznamu?';

  @override
  String get clean => 'Vyčistiť';

  @override
  String itemsCount(Object count) {
    return '$count položiek';
  }

  @override
  String get settings => 'Nastavenia';

  @override
  String get theme => 'Téma';

  @override
  String get system => 'Systém';

  @override
  String get light => 'Svetlá';

  @override
  String get dark => 'Tmavá';

  @override
  String get close => 'Zavrieť';

  @override
  String get listExists => 'Zoznam Už Existuje';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' už existuje';
  }

  @override
  String get addNewList => 'Pridať nový zoznam...';

  @override
  String get addNewItem => 'Pridať novú položku...';

  @override
  String get language => 'Jazyk';

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
