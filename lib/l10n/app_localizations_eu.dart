// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Basque (`eu`).
class AppLocalizationsEu extends AppLocalizations {
  AppLocalizationsEu([String locale = 'eu']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Zerrenda Berrizendatu';

  @override
  String get listName => 'Zerrendaren Izena';

  @override
  String get cancel => 'Utzi';

  @override
  String get rename => 'Berrizendatu';

  @override
  String get delete => 'Ezabatu';

  @override
  String get deleteList => 'Zerrenda Ezabatu';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Ziur zaude \"$listTitle\" ezabatu nahi duzula?';
  }

  @override
  String get cleanCompleted => 'Osatutako Elementuak Garbitu';

  @override
  String get cleanConfirmation =>
      'Zerrenda honetatik osatutako elementu guztiak kendu?';

  @override
  String get clean => 'Garbitu';

  @override
  String itemsCount(Object count) {
    return '$count elementu';
  }

  @override
  String get settings => 'Ezarpenak';

  @override
  String get theme => 'Gaia';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Argia';

  @override
  String get dark => 'Iluna';

  @override
  String get close => 'Itxi';

  @override
  String get listExists => 'Zerrenda Dagoeneko Existitzen Da';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' dagoeneko existitzen da';
  }

  @override
  String get addNewList => 'Zerrenda berria gehitu...';

  @override
  String get addNewItem => 'Elementu berria gehitu...';

  @override
  String get language => 'Hizkuntza';

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
