// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Gi Nytt Navn til Liste';

  @override
  String get listName => 'Listenavn';

  @override
  String get cancel => 'Avbryt';

  @override
  String get rename => 'Gi Nytt Navn';

  @override
  String get delete => 'Slett';

  @override
  String get deleteList => 'Slett Liste';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Er du sikker på at du vil slette \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Fjern Fullførte Elementer';

  @override
  String get cleanConfirmation =>
      'Fjerne alle fullførte elementer fra denne listen?';

  @override
  String get clean => 'Fjern';

  @override
  String itemsCount(Object count) {
    return '$count elementer';
  }

  @override
  String get settings => 'Innstillinger';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'System';

  @override
  String get light => 'Lys';

  @override
  String get dark => 'Mørk';

  @override
  String get close => 'Lukk';

  @override
  String get listExists => 'Listen Finnes Allerede';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' finnes allerede';
  }

  @override
  String get addNewList => 'Legg til ny liste...';

  @override
  String get addNewItem => 'Legg til nytt element...';

  @override
  String get language => 'Språk';

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
