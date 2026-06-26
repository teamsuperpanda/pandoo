// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Přejmenovat Seznam';

  @override
  String get listName => 'Název Seznamu';

  @override
  String get cancel => 'Zrušit';

  @override
  String get rename => 'Přejmenovat';

  @override
  String get delete => 'Smazat';

  @override
  String get deleteList => 'Smazat Seznam';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Opravdu chcete smazat \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Vyčistit Dokončené Položky';

  @override
  String get cleanConfirmation =>
      'Odstranit všechny dokončené položky z tohoto seznamu?';

  @override
  String get clean => 'Vyčistit';

  @override
  String itemsCount(Object count) {
    return '$count položek';
  }

  @override
  String get settings => 'Nastavení';

  @override
  String get theme => 'Motiv';

  @override
  String get system => 'Systém';

  @override
  String get light => 'Světlý';

  @override
  String get dark => 'Tmavý';

  @override
  String get close => 'Zavřít';

  @override
  String get listExists => 'Seznam Již Existuje';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' již existuje';
  }

  @override
  String get addNewList => 'Přidat nový seznam...';

  @override
  String get addNewItem => 'Přidat novou položku...';

  @override
  String get language => 'Jazyk';

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
