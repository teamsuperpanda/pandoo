// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'पांडू';

  @override
  String get renameList => 'यादीचे नाव बदला';

  @override
  String get listName => 'यादीचे नाव';

  @override
  String get cancel => 'रद्द करा';

  @override
  String get rename => 'नाव बदला';

  @override
  String get delete => 'हटवा';

  @override
  String get deleteList => 'यादी हटवा';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'तुम्हाला खात्री आहे की \"$listTitle\" हटवायचे आहे?';
  }

  @override
  String get cleanCompleted => 'पूर्ण झालेल्या आयटम्स साफ करा';

  @override
  String get cleanConfirmation =>
      'या यादीतून सर्व पूर्ण झालेले आयटम्स काढून टाकायचे?';

  @override
  String get clean => 'साफ करा';

  @override
  String itemsCount(Object count) {
    return '$count आयटम्स';
  }

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get theme => 'थीम';

  @override
  String get system => 'सिस्टम';

  @override
  String get light => 'प्रकाश';

  @override
  String get dark => 'गडद';

  @override
  String get close => 'बंद करा';

  @override
  String get listExists => 'यादी आधीच अस्तित्वात आहे';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' आधीच अस्तित्वात आहे';
  }

  @override
  String get addNewList => 'नवीन यादी जोडा...';

  @override
  String get addNewItem => 'नवीन आयटम जोडा...';

  @override
  String get language => 'भाषा';

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
