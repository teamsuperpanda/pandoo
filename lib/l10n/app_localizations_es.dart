// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renombrar lista';

  @override
  String get listName => 'Nombre de la lista';

  @override
  String get cancel => 'Cancelar';

  @override
  String get rename => 'Renombrar';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteList => 'Eliminar lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return '¿Estás seguro de que quieres eliminar \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Limpiar elementos completados';

  @override
  String get cleanConfirmation =>
      '¿Eliminar todos los elementos completados de esta lista?';

  @override
  String get clean => 'Limpiar';

  @override
  String itemsCount(Object count) {
    return '$count elementos';
  }

  @override
  String get settings => 'Ajustes';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Oscuro';

  @override
  String get close => 'Cerrar';

  @override
  String get listExists => 'La lista ya existe';

  @override
  String listExistsMessage(Object name) {
    return '\"$name\" ya existe';
  }

  @override
  String get addNewList => 'Agregar nueva lista...';

  @override
  String get addNewItem => 'Agregar nuevo elemento...';

  @override
  String get language => 'Idioma';

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

/// The translations for Spanish Castilian, as used in Latin America and the Caribbean (`es_419`).
class AppLocalizationsEs419 extends AppLocalizationsEs {
  AppLocalizationsEs419() : super('es_419');

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renombrar Lista';

  @override
  String get listName => 'Nombre de la Lista';

  @override
  String get cancel => 'Cancelar';

  @override
  String get rename => 'Renombrar';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteList => 'Eliminar Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return '¿Estás seguro de que deseas eliminar \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Limpiar Elementos Completados';

  @override
  String get cleanConfirmation =>
      '¿Eliminar todos los elementos completados de esta lista?';

  @override
  String get clean => 'Limpiar';

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
  String get dark => 'Oscuro';

  @override
  String get close => 'Cerrar';

  @override
  String get listExists => 'La Lista Ya Existe';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ya existe';
  }

  @override
  String get addNewList => 'Agregar nueva lista...';

  @override
  String get addNewItem => 'Agregar nuevo elemento...';

  @override
  String get language => 'Idioma';

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
