// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Lithuanian (`lt`).
class AppLocalizationsLt extends AppLocalizations {
  AppLocalizationsLt([String locale = 'lt']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Pervadinti Sąrašą';

  @override
  String get listName => 'Sąrašo Pavadinimas';

  @override
  String get cancel => 'Atšaukti';

  @override
  String get rename => 'Pervadinti';

  @override
  String get delete => 'Ištrinti';

  @override
  String get deleteList => 'Ištrinti Sąrašą';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Ar tikrai norite ištrinti \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Išvalyti Baigtus Elementus';

  @override
  String get cleanConfirmation =>
      'Pašalinti visus baigtus elementus iš šio sąrašo?';

  @override
  String get clean => 'Išvalyti';

  @override
  String itemsCount(Object count) {
    return '$count elementai';
  }

  @override
  String get settings => 'Nustatymai';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Šviesus';

  @override
  String get dark => 'Tamsus';

  @override
  String get close => 'Uždaryti';

  @override
  String get listExists => 'Sąrašas Jau Egzistuoja';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' jau egzistuoja';
  }

  @override
  String get addNewList => 'Pridėti naują sąrašą...';

  @override
  String get addNewItem => 'Pridėti naują elementą...';

  @override
  String get language => 'Kalba';

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
