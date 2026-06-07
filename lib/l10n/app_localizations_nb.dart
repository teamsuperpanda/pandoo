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
  String get analytics => 'Analytics';

  @override
  String get enableAnalytics => 'Enable Analytics';

  @override
  String get animateAddButton => 'Animation';
}
