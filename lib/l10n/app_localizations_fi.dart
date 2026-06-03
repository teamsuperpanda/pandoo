// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Nimeä Lista Uudelleen';

  @override
  String get listName => 'Listan Nimi';

  @override
  String get cancel => 'Peruuta';

  @override
  String get rename => 'Nimeä Uudelleen';

  @override
  String get delete => 'Poista';

  @override
  String get deleteList => 'Poista Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Haluatko varmasti poistaa \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Tyhjennä Valmiit Kohteet';

  @override
  String get cleanConfirmation =>
      'Poistetaanko kaikki valmiit kohteet tästä listasta?';

  @override
  String get clean => 'Tyhjennä';

  @override
  String itemsCount(Object count) {
    return '$count kohdetta';
  }

  @override
  String get settings => 'Asetukset';

  @override
  String get theme => 'Teema';

  @override
  String get system => 'Järjestelmä';

  @override
  String get light => 'Vaalea';

  @override
  String get dark => 'Tumma';

  @override
  String get close => 'Sulje';

  @override
  String get listExists => 'Lista On Jo Olemassa';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' on jo olemassa';
  }

  @override
  String get addNewList => 'Lisää uusi lista...';

  @override
  String get addNewItem => 'Lisää uusi kohde...';

  @override
  String get language => 'Kieli';

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
