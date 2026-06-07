// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Lijst Hernoemen';

  @override
  String get listName => 'Lijstnaam';

  @override
  String get cancel => 'Annuleren';

  @override
  String get rename => 'Hernoemen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get deleteList => 'Lijst Verwijderen';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Weet je zeker dat je \"$listTitle\" wilt verwijderen?';
  }

  @override
  String get cleanCompleted => 'Voltooide Items Opschonen';

  @override
  String get cleanConfirmation =>
      'Alle voltooide items uit deze lijst verwijderen?';

  @override
  String get clean => 'Opschonen';

  @override
  String itemsCount(Object count) {
    return '$count items';
  }

  @override
  String get settings => 'Instellingen';

  @override
  String get theme => 'Thema';

  @override
  String get system => 'Systeem';

  @override
  String get light => 'Licht';

  @override
  String get dark => 'Donker';

  @override
  String get close => 'Sluiten';

  @override
  String get listExists => 'Lijst Bestaat Al';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' bestaat al';
  }

  @override
  String get addNewList => 'Nieuwe lijst toevoegen...';

  @override
  String get addNewItem => 'Nieuw item toevoegen...';

  @override
  String get language => 'Taal';

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
