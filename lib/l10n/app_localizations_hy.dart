// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Armenian (`hy`).
class AppLocalizationsHy extends AppLocalizations {
  AppLocalizationsHy([String locale = 'hy']) : super(locale);

  @override
  String get appTitle => 'Պանդու';

  @override
  String get renameList => 'Վերանվանել Ցուցակը';

  @override
  String get listName => 'Ցուցակի Անունը';

  @override
  String get cancel => 'Չեղարկել';

  @override
  String get rename => 'Վերանվանել';

  @override
  String get delete => 'Ջնջել';

  @override
  String get deleteList => 'Ջնջել Ցուցակը';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Վստա՞հ եք, որ ցանկանում եք ջնջել \"$listTitle\"-ը:';
  }

  @override
  String get cleanCompleted => 'Մաքրել Ավարտված Տարրերը';

  @override
  String get cleanConfirmation =>
      'Հեռացնե՞լ բոլոր ավարտված տարրերը այս ցուցակից:';

  @override
  String get clean => 'Մաքրել';

  @override
  String itemsCount(Object count) {
    return '$count տարր';
  }

  @override
  String get settings => 'Կարգավորումներ';

  @override
  String get theme => 'Թեմա';

  @override
  String get system => 'Համակարգ';

  @override
  String get light => 'Լուսավոր';

  @override
  String get dark => 'Մուգ';

  @override
  String get close => 'Փակել';

  @override
  String get listExists => 'Ցուցակն Արդեն Գոյություն Ունի';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\'-ն արդեն գոյություն ունի';
  }

  @override
  String get addNewList => 'Ավելացնել նոր ցուցակ...';

  @override
  String get addNewItem => 'Ավելացնել նոր տարր...';

  @override
  String get language => 'Լեզու';

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
