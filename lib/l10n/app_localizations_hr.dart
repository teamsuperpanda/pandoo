// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Preimenuj Listu';

  @override
  String get listName => 'Naziv Liste';

  @override
  String get cancel => 'Odustani';

  @override
  String get rename => 'Preimenuj';

  @override
  String get delete => 'Izbriši';

  @override
  String get deleteList => 'Izbriši Listu';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Jeste li sigurni da želite izbrisati \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Očisti Završene Stavke';

  @override
  String get cleanConfirmation => 'Ukloniti sve završene stavke s ove liste?';

  @override
  String get clean => 'Očisti';

  @override
  String itemsCount(Object count) {
    return '$count stavki';
  }

  @override
  String get settings => 'Postavke';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sustav';

  @override
  String get light => 'Svijetla';

  @override
  String get dark => 'Tamna';

  @override
  String get close => 'Zatvori';

  @override
  String get listExists => 'Lista Već Postoji';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' već postoji';
  }

  @override
  String get addNewList => 'Dodaj novu listu...';

  @override
  String get addNewItem => 'Dodaj novu stavku...';

  @override
  String get language => 'Jezik';
}
