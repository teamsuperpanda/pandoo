// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Afrikaans (`af`).
class AppLocalizationsAf extends AppLocalizations {
  AppLocalizationsAf([String locale = 'af']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Hernoem Lys';

  @override
  String get listName => 'Lysnaam';

  @override
  String get cancel => 'Kanselleer';

  @override
  String get rename => 'Hernoem';

  @override
  String get delete => 'Verwyder';

  @override
  String get deleteList => 'Verwyder Lys';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Is jy seker jy wil \"$listTitle\" verwyder?';
  }

  @override
  String get cleanCompleted => 'Verwyder Voltooide Items';

  @override
  String get cleanConfirmation =>
      'Verwyder alle voltooide items van hierdie lys?';

  @override
  String get clean => 'Verwyder';

  @override
  String itemsCount(Object count) {
    return '$count items';
  }

  @override
  String get settings => 'Instellings';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Stelsel';

  @override
  String get light => 'Lig';

  @override
  String get dark => 'Donker';

  @override
  String get close => 'Sluit';

  @override
  String get listExists => 'Lys Bestaan Reeds';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' bestaan reeds';
  }

  @override
  String get addNewList => 'Voeg nuwe lys by...';

  @override
  String get addNewItem => 'Voeg nuwe item by...';

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
