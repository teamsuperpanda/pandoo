// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get appTitle => 'Πάντου';

  @override
  String get renameList => 'Μετονομασία Λίστας';

  @override
  String get listName => 'Όνομα Λίστας';

  @override
  String get cancel => 'Ακύρωση';

  @override
  String get rename => 'Μετονομασία';

  @override
  String get delete => 'Διαγραφή';

  @override
  String get deleteList => 'Διαγραφή Λίστας';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Είστε σίγουροι ότι θέλετε να διαγράψετε το \"$listTitle\";';
  }

  @override
  String get cleanCompleted => 'Εκκαθάριση Ολοκληρωμένων Στοιχείων';

  @override
  String get cleanConfirmation =>
      'Αφαίρεση όλων των ολοκληρωμένων στοιχείων από αυτή τη λίστα;';

  @override
  String get clean => 'Εκκαθάριση';

  @override
  String itemsCount(Object count) {
    return '$count στοιχεία';
  }

  @override
  String get settings => 'Ρυθμίσεις';

  @override
  String get theme => 'Θέμα';

  @override
  String get system => 'Σύστημα';

  @override
  String get light => 'Φωτεινό';

  @override
  String get dark => 'Σκοτεινό';

  @override
  String get close => 'Κλείσιμο';

  @override
  String get listExists => 'Η Λίστα Υπάρχει Ήδη';

  @override
  String listExistsMessage(Object name) {
    return 'Το \'$name\' υπάρχει ήδη';
  }

  @override
  String get addNewList => 'Προσθήκη νέας λίστας...';

  @override
  String get addNewItem => 'Προσθήκη νέου στοιχείου...';

  @override
  String get language => 'Γλώσσα';
}
