// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Galician (`gl`).
class AppLocalizationsGl extends AppLocalizations {
  AppLocalizationsGl([String locale = 'gl']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renomear Lista';

  @override
  String get listName => 'Nome da Lista';

  @override
  String get cancel => 'Cancelar';

  @override
  String get rename => 'Renomear';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteList => 'Eliminar Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Estás seguro de que queres eliminar \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Limpar Elementos Completados';

  @override
  String get cleanConfirmation =>
      'Eliminar todos os elementos completados desta lista?';

  @override
  String get clean => 'Limpar';

  @override
  String itemsCount(Object count) {
    return '$count elementos';
  }

  @override
  String get settings => 'Configuración';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get close => 'Pechar';

  @override
  String get listExists => 'A Lista Xa Existe';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' xa existe';
  }

  @override
  String get addNewList => 'Engadir nova lista...';

  @override
  String get addNewItem => 'Engadir novo elemento...';

  @override
  String get language => 'Idioma';

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
