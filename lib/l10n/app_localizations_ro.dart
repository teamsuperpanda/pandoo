// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Redenumește Lista';

  @override
  String get listName => 'Numele Listei';

  @override
  String get cancel => 'Anulează';

  @override
  String get rename => 'Redenumește';

  @override
  String get delete => 'Șterge';

  @override
  String get deleteList => 'Șterge Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Sigur doriți să ștergeți \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Curăță Elementele Completate';

  @override
  String get cleanConfirmation =>
      'Eliminați toate elementele completate din această listă?';

  @override
  String get clean => 'Curăță';

  @override
  String itemsCount(Object count) {
    return '$count elemente';
  }

  @override
  String get settings => 'Setări';

  @override
  String get theme => 'Temă';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'Luminos';

  @override
  String get dark => 'Întunecat';

  @override
  String get close => 'Închide';

  @override
  String get listExists => 'Lista Există Deja';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' există deja';
  }

  @override
  String get addNewList => 'Adaugă listă nouă...';

  @override
  String get addNewItem => 'Adaugă element nou...';

  @override
  String get language => 'Limbă';
}
