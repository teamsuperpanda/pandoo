// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get appTitle => 'פנדו';

  @override
  String get renameList => 'שנה שם רשימה';

  @override
  String get listName => 'שם הרשימה';

  @override
  String get cancel => 'ביטול';

  @override
  String get rename => 'שנה שם';

  @override
  String get delete => 'מחק';

  @override
  String get deleteList => 'מחק רשימה';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'האם אתה בטוח שברצונך למחוק את \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'נקה פריטים שהושלמו';

  @override
  String get cleanConfirmation => 'להסיר את כל הפריטים שהושלמו מרשימה זו?';

  @override
  String get clean => 'נקה';

  @override
  String itemsCount(Object count) {
    return '$count פריטים';
  }

  @override
  String get settings => 'הגדרות';

  @override
  String get theme => 'ערכת נושא';

  @override
  String get system => 'מערכת';

  @override
  String get light => 'בהיר';

  @override
  String get dark => 'כהה';

  @override
  String get close => 'סגור';

  @override
  String get listExists => 'הרשימה כבר קיימת';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' כבר קיים';
  }

  @override
  String get addNewList => 'הוסף רשימה חדשה...';

  @override
  String get addNewItem => 'הוסף פריט חדש...';

  @override
  String get language => 'שפה';

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
