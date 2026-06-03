// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renommer la liste';

  @override
  String get listName => 'Nom de la liste';

  @override
  String get cancel => 'Annuler';

  @override
  String get rename => 'Renommer';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteList => 'Supprimer la liste';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Voulez-vous vraiment supprimer \"$listTitle\" ?';
  }

  @override
  String get cleanCompleted => 'Nettoyer les éléments terminés';

  @override
  String get cleanConfirmation =>
      'Supprimer tous les éléments terminés de cette liste ?';

  @override
  String get clean => 'Nettoyer';

  @override
  String itemsCount(Object count) {
    return '$count éléments';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get close => 'Fermer';

  @override
  String get listExists => 'La liste existe déjà';

  @override
  String listExistsMessage(Object name) {
    return '\"$name\" existe déjà';
  }

  @override
  String get addNewList => 'Ajouter une nouvelle liste...';

  @override
  String get addNewItem => 'Ajouter un nouvel élément...';

  @override
  String get language => 'Langue';

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

/// The translations for French, as used in Canada (`fr_CA`).
class AppLocalizationsFrCa extends AppLocalizationsFr {
  AppLocalizationsFrCa() : super('fr_CA');

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renommer la Liste';

  @override
  String get listName => 'Nom de la Liste';

  @override
  String get cancel => 'Annuler';

  @override
  String get rename => 'Renommer';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteList => 'Supprimer la Liste';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Êtes-vous sûr de vouloir supprimer \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Nettoyer les Éléments Terminés';

  @override
  String get cleanConfirmation =>
      'Supprimer tous les éléments terminés de cette liste?';

  @override
  String get clean => 'Nettoyer';

  @override
  String itemsCount(Object count) {
    return '$count éléments';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get close => 'Fermer';

  @override
  String get listExists => 'La Liste Existe Déjà';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' existe déjà';
  }

  @override
  String get addNewList => 'Ajouter une nouvelle liste...';

  @override
  String get addNewItem => 'Ajouter un nouvel élément...';

  @override
  String get language => 'Langue';

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

/// The translations for French, as used in France (`fr_FR`).
class AppLocalizationsFrFr extends AppLocalizationsFr {
  AppLocalizationsFrFr() : super('fr_FR');

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renommer la Liste';

  @override
  String get listName => 'Nom de la Liste';

  @override
  String get cancel => 'Annuler';

  @override
  String get rename => 'Renommer';

  @override
  String get delete => 'Supprimer';

  @override
  String get deleteList => 'Supprimer la Liste';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Êtes-vous sûr de vouloir supprimer \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Nettoyer les Éléments Terminés';

  @override
  String get cleanConfirmation =>
      'Supprimer tous les éléments terminés de cette liste?';

  @override
  String get clean => 'Nettoyer';

  @override
  String itemsCount(Object count) {
    return '$count éléments';
  }

  @override
  String get settings => 'Paramètres';

  @override
  String get theme => 'Thème';

  @override
  String get system => 'Système';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get close => 'Fermer';

  @override
  String get listExists => 'La Liste Existe Déjà';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' existe déjà';
  }

  @override
  String get addNewList => 'Ajouter une nouvelle liste...';

  @override
  String get addNewItem => 'Ajouter un nouvel élément...';

  @override
  String get language => 'Langue';

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
