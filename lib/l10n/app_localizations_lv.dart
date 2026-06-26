// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Latvian (`lv`).
class AppLocalizationsLv extends AppLocalizations {
  AppLocalizationsLv([String locale = 'lv']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Pārdēvēt Sarakstu';

  @override
  String get listName => 'Saraksta Nosaukums';

  @override
  String get cancel => 'Atcelt';

  @override
  String get rename => 'Pārdēvēt';

  @override
  String get delete => 'Dzēst';

  @override
  String get deleteList => 'Dzēst Sarakstu';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Vai tiešām vēlaties dzēst \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Notīrīt Pabeigtos Vienumus';

  @override
  String get cleanConfirmation =>
      'Noņemt visus pabeigtos vienumus no šī saraksta?';

  @override
  String get clean => 'Notīrīt';

  @override
  String itemsCount(Object count) {
    return '$count vienumi';
  }

  @override
  String get settings => 'Iestatījumi';

  @override
  String get theme => 'Tēma';

  @override
  String get system => 'Sistēma';

  @override
  String get light => 'Gaišs';

  @override
  String get dark => 'Tumšs';

  @override
  String get close => 'Aizvērt';

  @override
  String get listExists => 'Saraksts Jau Pastāv';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' jau pastāv';
  }

  @override
  String get addNewList => 'Pievienot jaunu sarakstu...';

  @override
  String get addNewItem => 'Pievienot jaunu vienumu...';

  @override
  String get language => 'Valoda';

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
