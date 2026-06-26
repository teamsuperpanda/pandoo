// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Rinomina Lista';

  @override
  String get listName => 'Nome Lista';

  @override
  String get cancel => 'Annulla';

  @override
  String get rename => 'Rinomina';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteList => 'Elimina Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Sei sicuro di voler eliminare \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Pulisci Elementi Completati';

  @override
  String get cleanConfirmation =>
      'Rimuovere tutti gli elementi completati da questa lista?';

  @override
  String get clean => 'Pulisci';

  @override
  String itemsCount(Object count) {
    return '$count elementi';
  }

  @override
  String get settings => 'Impostazioni';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Chiaro';

  @override
  String get dark => 'Scuro';

  @override
  String get close => 'Chiudi';

  @override
  String get listExists => 'La Lista Esiste Già';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' esiste già';
  }

  @override
  String get addNewList => 'Aggiungi nuova lista...';

  @override
  String get addNewItem => 'Aggiungi nuovo elemento...';

  @override
  String get language => 'Lingua';

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
