// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Preimenuj Seznam';

  @override
  String get listName => 'Ime Seznama';

  @override
  String get cancel => 'Prekliči';

  @override
  String get rename => 'Preimenuj';

  @override
  String get delete => 'Izbriši';

  @override
  String get deleteList => 'Izbriši Seznam';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Ali ste prepričani, da želite izbrisati \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Počisti Končane Elemente';

  @override
  String get cleanConfirmation =>
      'Odstrani vse končane elemente s tega seznama?';

  @override
  String get clean => 'Počisti';

  @override
  String itemsCount(Object count) {
    return '$count elementov';
  }

  @override
  String get settings => 'Nastavitve';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'Svetla';

  @override
  String get dark => 'Temna';

  @override
  String get close => 'Zapri';

  @override
  String get listExists => 'Seznam Že Obstaja';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' že obstaja';
  }

  @override
  String get addNewList => 'Dodaj nov seznam...';

  @override
  String get addNewItem => 'Dodaj nov element...';

  @override
  String get language => 'Jezik';

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
