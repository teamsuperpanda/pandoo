// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Estonian (`et`).
class AppLocalizationsEt extends AppLocalizations {
  AppLocalizationsEt([String locale = 'et']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Nimeta Loend Ümber';

  @override
  String get listName => 'Loendi Nimi';

  @override
  String get cancel => 'Tühista';

  @override
  String get rename => 'Nimeta Ümber';

  @override
  String get delete => 'Kustuta';

  @override
  String get deleteList => 'Kustuta Loend';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Kas oled kindel, et soovid kustutada \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Puhasta Lõpetatud Üksused';

  @override
  String get cleanConfirmation =>
      'Kas eemaldada kõik lõpetatud üksused sellest loendist?';

  @override
  String get clean => 'Puhasta';

  @override
  String itemsCount(Object count) {
    return '$count üksust';
  }

  @override
  String get settings => 'Seaded';

  @override
  String get theme => 'Teema';

  @override
  String get system => 'Süsteem';

  @override
  String get light => 'Hele';

  @override
  String get dark => 'Tume';

  @override
  String get close => 'Sulge';

  @override
  String get listExists => 'Loend Juba Eksisteerib';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' on juba olemas';
  }

  @override
  String get addNewList => 'Lisa uus loend...';

  @override
  String get addNewItem => 'Lisa uus üksus...';

  @override
  String get language => 'Keel';

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
