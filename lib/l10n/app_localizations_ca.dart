// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Canviar Nom de la Llista';

  @override
  String get listName => 'Nom de la Llista';

  @override
  String get cancel => 'Cancel·lar';

  @override
  String get rename => 'Canviar Nom';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteList => 'Eliminar Llista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Estàs segur que vols eliminar \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Netejar Elements Completats';

  @override
  String get cleanConfirmation =>
      'Eliminar tots els elements completats d\'aquesta llista?';

  @override
  String get clean => 'Netejar';

  @override
  String itemsCount(Object count) {
    return '$count elements';
  }

  @override
  String get settings => 'Configuració';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Clar';

  @override
  String get dark => 'Fosc';

  @override
  String get close => 'Tancar';

  @override
  String get listExists => 'La Llista Ja Existeix';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ja existeix';
  }

  @override
  String get addNewList => 'Afegir nova llista...';

  @override
  String get addNewItem => 'Afegir nou element...';

  @override
  String get language => 'Idioma';
}
