// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Renomear lista';

  @override
  String get listName => 'Nome da lista';

  @override
  String get cancel => 'Cancelar';

  @override
  String get rename => 'Renomear';

  @override
  String get delete => 'Excluir';

  @override
  String get deleteList => 'Excluir lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Tem certeza que deseja excluir \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Limpar itens concluídos';

  @override
  String get cleanConfirmation =>
      'Remover todos os itens concluídos desta lista?';

  @override
  String get clean => 'Limpar';

  @override
  String itemsCount(Object count) {
    return '$count itens';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get close => 'Fechar';

  @override
  String get listExists => 'A lista já existe';

  @override
  String listExistsMessage(Object name) {
    return '\"$name\" já existe';
  }

  @override
  String get addNewList => 'Adicionar nova lista...';

  @override
  String get addNewItem => 'Adicionar novo item...';

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

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

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
  String get delete => 'Excluir';

  @override
  String get deleteList => 'Excluir Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Tem certeza que deseja excluir \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Limpar Itens Concluídos';

  @override
  String get cleanConfirmation =>
      'Remover todos os itens concluídos desta lista?';

  @override
  String get clean => 'Limpar';

  @override
  String itemsCount(Object count) {
    return '$count itens';
  }

  @override
  String get settings => 'Configurações';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get close => 'Fechar';

  @override
  String get listExists => 'Lista Já Existe';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' já existe';
  }

  @override
  String get addNewList => 'Adicionar nova lista...';

  @override
  String get addNewItem => 'Adicionar novo item...';

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

/// The translations for Portuguese, as used in Portugal (`pt_PT`).
class AppLocalizationsPtPt extends AppLocalizationsPt {
  AppLocalizationsPtPt() : super('pt_PT');

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
    return 'Tem a certeza que pretende eliminar \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Limpar Itens Concluídos';

  @override
  String get cleanConfirmation =>
      'Remover todos os itens concluídos desta lista?';

  @override
  String get clean => 'Limpar';

  @override
  String itemsCount(Object count) {
    return '$count itens';
  }

  @override
  String get settings => 'Definições';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistema';

  @override
  String get light => 'Claro';

  @override
  String get dark => 'Escuro';

  @override
  String get close => 'Fechar';

  @override
  String get listExists => 'Lista Já Existe';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' já existe';
  }

  @override
  String get addNewList => 'Adicionar nova lista...';

  @override
  String get addNewItem => 'Adicionar novo item...';

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
