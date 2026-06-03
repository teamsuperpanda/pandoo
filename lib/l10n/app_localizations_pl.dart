// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Zmień Nazwę Listy';

  @override
  String get listName => 'Nazwa Listy';

  @override
  String get cancel => 'Anuluj';

  @override
  String get rename => 'Zmień Nazwę';

  @override
  String get delete => 'Usuń';

  @override
  String get deleteList => 'Usuń Listę';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Czy na pewno chcesz usunąć \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Wyczyść Ukończone Elementy';

  @override
  String get cleanConfirmation =>
      'Usunąć wszystkie ukończone elementy z tej listy?';

  @override
  String get clean => 'Wyczyść';

  @override
  String itemsCount(Object count) {
    return '$count elementów';
  }

  @override
  String get settings => 'Ustawienia';

  @override
  String get theme => 'Motyw';

  @override
  String get system => 'System';

  @override
  String get light => 'Jasny';

  @override
  String get dark => 'Ciemny';

  @override
  String get close => 'Zamknij';

  @override
  String get listExists => 'Lista Już Istnieje';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' już istnieje';
  }

  @override
  String get addNewList => 'Dodaj nową listę...';

  @override
  String get addNewItem => 'Dodaj nowy element...';

  @override
  String get language => 'Język';

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
