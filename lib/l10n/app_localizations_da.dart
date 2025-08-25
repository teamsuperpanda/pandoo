// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Omdøb Liste';

  @override
  String get listName => 'Listenavn';

  @override
  String get cancel => 'Annuller';

  @override
  String get rename => 'Omdøb';

  @override
  String get delete => 'Slet';

  @override
  String get deleteList => 'Slet Liste';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Er du sikker på, at du vil slette \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Ryd Færdige Elementer';

  @override
  String get cleanConfirmation =>
      'Fjern alle færdige elementer fra denne liste?';

  @override
  String get clean => 'Ryd';

  @override
  String itemsCount(Object count) {
    return '$count elementer';
  }

  @override
  String get settings => 'Indstillinger';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'System';

  @override
  String get light => 'Lys';

  @override
  String get dark => 'Mørk';

  @override
  String get close => 'Luk';

  @override
  String get listExists => 'Listen Findes Allerede';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' findes allerede';
  }

  @override
  String get addNewList => 'Tilføj ny liste...';

  @override
  String get addNewItem => 'Tilføj nyt element...';

  @override
  String get language => 'Sprog';
}
