// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Liste Umbenennen';

  @override
  String get listName => 'Listenname';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get rename => 'Umbenennen';

  @override
  String get delete => 'Löschen';

  @override
  String get deleteList => 'Liste Löschen';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Sind Sie sicher, dass Sie \"$listTitle\" löschen möchten?';
  }

  @override
  String get cleanCompleted => 'Erledigte Einträge Entfernen';

  @override
  String get cleanConfirmation =>
      'Alle erledigten Einträge aus dieser Liste entfernen?';

  @override
  String get clean => 'Entfernen';

  @override
  String itemsCount(Object count) {
    return '$count Einträge';
  }

  @override
  String get settings => 'Einstellungen';

  @override
  String get theme => 'Design';

  @override
  String get system => 'System';

  @override
  String get light => 'Hell';

  @override
  String get dark => 'Dunkel';

  @override
  String get close => 'Schließen';

  @override
  String get listExists => 'Liste Existiert Bereits';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' existiert bereits';
  }

  @override
  String get addNewList => 'Neue Liste hinzufügen...';

  @override
  String get addNewItem => 'Neuen Eintrag hinzufügen...';

  @override
  String get language => 'Sprache';
}
