// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Georgian (`ka`).
class AppLocalizationsKa extends AppLocalizations {
  AppLocalizationsKa([String locale = 'ka']) : super(locale);

  @override
  String get appTitle => 'პანდუ';

  @override
  String get renameList => 'სიის გადარქმევა';

  @override
  String get listName => 'სიის სახელი';

  @override
  String get cancel => 'გაუქმება';

  @override
  String get rename => 'გადარქმევა';

  @override
  String get delete => 'წაშლა';

  @override
  String get deleteList => 'სიის წაშლა';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'დარწმუნებული ხართ, რომ გსურთ \"$listTitle\"-ის წაშლა?';
  }

  @override
  String get cleanCompleted => 'დასრულებული ელემენტების გასუფთავება';

  @override
  String get cleanConfirmation =>
      'წავშალოთ ყველა დასრულებული ელემენტი ამ სიიდან?';

  @override
  String get clean => 'გასუფთავება';

  @override
  String itemsCount(Object count) {
    return '$count ელემენტი';
  }

  @override
  String get settings => 'პარამეტრები';

  @override
  String get theme => 'თემა';

  @override
  String get system => 'სისტემა';

  @override
  String get light => 'ნათელი';

  @override
  String get dark => 'მუქი';

  @override
  String get close => 'დახურვა';

  @override
  String get listExists => 'სია უკვე არსებობს';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' უკვე არსებობს';
  }

  @override
  String get addNewList => 'ახალი სიის დამატება...';

  @override
  String get addNewItem => 'ახალი ელემენტის დამატება...';

  @override
  String get language => 'ენა';
}
