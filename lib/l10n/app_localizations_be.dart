// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Belarusian (`be`).
class AppLocalizationsBe extends AppLocalizations {
  AppLocalizationsBe([String locale = 'be']) : super(locale);

  @override
  String get appTitle => 'Пандо';

  @override
  String get renameList => 'Перайменаваць Спіс';

  @override
  String get listName => 'Назва Спіса';

  @override
  String get cancel => 'Адмяніць';

  @override
  String get rename => 'Перайменаваць';

  @override
  String get delete => 'Выдаліць';

  @override
  String get deleteList => 'Выдаліць Спіс';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Вы ўпэўнены, што хочаце выдаліць \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Ачысціць Выкананыя Элементы';

  @override
  String get cleanConfirmation =>
      'Выдаліць усе выкананыя элементы з гэтага спіса?';

  @override
  String get clean => 'Ачысціць';

  @override
  String itemsCount(Object count) {
    return '$count элементаў';
  }

  @override
  String get settings => 'Налады';

  @override
  String get theme => 'Тэма';

  @override
  String get system => 'Сістэма';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Цёмная';

  @override
  String get close => 'Закрыць';

  @override
  String get listExists => 'Спіс Ужо Існуе';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ужо існуе';
  }

  @override
  String get addNewList => 'Дадаць новы спіс...';

  @override
  String get addNewItem => 'Дадаць новы элемент...';

  @override
  String get language => 'Мова';
}
