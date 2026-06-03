// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'પાંડૂ';

  @override
  String get renameList => 'યાદી નું નામ બદલો';

  @override
  String get listName => 'યાદી નું નામ';

  @override
  String get cancel => 'રદ કરો';

  @override
  String get rename => 'નામ બદલો';

  @override
  String get delete => 'કાઢી નાખો';

  @override
  String get deleteList => 'યાદી કાઢી નાખો';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'શું તમે ખરેખર \"$listTitle\" ને કાઢી નાખવા માંગો છો?';
  }

  @override
  String get cleanCompleted => 'પૂર્ણ થયેલી વસ્તુઓ સાફ કરો';

  @override
  String get cleanConfirmation =>
      'આ યાદીમાંથી બધી પૂર્ણ થયેલી વસ્તુઓ દૂર કરવી છે?';

  @override
  String get clean => 'સાફ કરો';

  @override
  String itemsCount(Object count) {
    return '$count વસ્તુઓ';
  }

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get theme => 'થીમ';

  @override
  String get system => 'સિસ્ટમ';

  @override
  String get light => 'પ્રકાશિત';

  @override
  String get dark => 'ઘેરું';

  @override
  String get close => 'બંધ કરો';

  @override
  String get listExists => 'યાદી પહેલેથી અસ્તિત્વમાં છે';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' પહેલેથી અસ્તિત્વમાં છે';
  }

  @override
  String get addNewList => 'નવી યાદી ઉમેરો...';

  @override
  String get addNewItem => 'નવી વસ્તુ ઉમેરો...';

  @override
  String get language => 'ભાષા';

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
