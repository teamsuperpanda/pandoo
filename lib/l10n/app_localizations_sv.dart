// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Byt Namn på Lista';

  @override
  String get listName => 'Listnamn';

  @override
  String get cancel => 'Avbryt';

  @override
  String get rename => 'Byt Namn';

  @override
  String get delete => 'Ta Bort';

  @override
  String get deleteList => 'Ta Bort Lista';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Är du säker på att du vill ta bort \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Rensa Färdiga Objekt';

  @override
  String get cleanConfirmation =>
      'Ta bort alla färdiga objekt från denna lista?';

  @override
  String get clean => 'Rensa';

  @override
  String itemsCount(Object count) {
    return '$count objekt';
  }

  @override
  String get settings => 'Inställningar';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'System';

  @override
  String get light => 'Ljust';

  @override
  String get dark => 'Mörkt';

  @override
  String get close => 'Stäng';

  @override
  String get listExists => 'Listan Finns Redan';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' finns redan';
  }

  @override
  String get addNewList => 'Lägg till ny lista...';

  @override
  String get addNewItem => 'Lägg till nytt objekt...';

  @override
  String get language => 'Språk';
}
