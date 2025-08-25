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
}
