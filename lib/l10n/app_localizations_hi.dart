// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'पांडू';

  @override
  String get renameList => 'सूची का नाम बदलें';

  @override
  String get listName => 'सूची का नाम';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get rename => 'नाम बदलें';

  @override
  String get delete => 'हटाएं';

  @override
  String get deleteList => 'सूची हटाएं';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'क्या आप वाकई \"$listTitle\" को हटाना चाहते हैं?';
  }

  @override
  String get cleanCompleted => 'पूर्ण आइटम साफ़ करें';

  @override
  String get cleanConfirmation => 'इस सूची से सभी पूर्ण आइटम हटाएं?';

  @override
  String get clean => 'साफ़ करें';

  @override
  String itemsCount(Object count) {
    return '$count आइटम';
  }

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get theme => 'थीम';

  @override
  String get system => 'सिस्टम';

  @override
  String get light => 'हल्का';

  @override
  String get dark => 'गहरा';

  @override
  String get close => 'बंद करें';

  @override
  String get listExists => 'सूची पहले से मौजूद है';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' पहले से मौजूद है';
  }

  @override
  String get addNewList => 'नई सूची जोड़ें...';

  @override
  String get addNewItem => 'नया आइटम जोड़ें...';

  @override
  String get language => 'भाषा';
}
