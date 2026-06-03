// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Serbian (`sr`).
class AppLocalizationsSr extends AppLocalizations {
  AppLocalizationsSr([String locale = 'sr']) : super(locale);

  @override
  String get appTitle => 'Пандо';

  @override
  String get renameList => 'Преименуј Листу';

  @override
  String get listName => 'Име Листе';

  @override
  String get cancel => 'Откажи';

  @override
  String get rename => 'Преименуј';

  @override
  String get delete => 'Обриши';

  @override
  String get deleteList => 'Обриши Листу';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Да ли сте сигурни да желите да обришете \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Очисти Завршене Ставке';

  @override
  String get cleanConfirmation => 'Уклонити све завршене ставке са ове листе?';

  @override
  String get clean => 'Очисти';

  @override
  String itemsCount(Object count) {
    return '$count ставки';
  }

  @override
  String get settings => 'Подешавања';

  @override
  String get theme => 'Тема';

  @override
  String get system => 'Систем';

  @override
  String get light => 'Светла';

  @override
  String get dark => 'Тамна';

  @override
  String get close => 'Затвори';

  @override
  String get listExists => 'Листа Већ Постоји';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' већ постоји';
  }

  @override
  String get addNewList => 'Додај нову листу...';

  @override
  String get addNewItem => 'Додај нову ставку...';

  @override
  String get language => 'Језик';

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
