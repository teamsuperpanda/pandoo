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
}
