// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Burmese (`my`).
class AppLocalizationsMy extends AppLocalizations {
  AppLocalizationsMy([String locale = 'my']) : super(locale);

  @override
  String get appTitle => 'ပန်ဒူး';

  @override
  String get renameList => 'စာရင်းအမည်ပြောင်းရန်';

  @override
  String get listName => 'စာရင်းအမည်';

  @override
  String get cancel => 'ပယ်ဖျက်ရန်';

  @override
  String get rename => 'အမည်ပြောင်းရန်';

  @override
  String get delete => 'ဖျက်ရန်';

  @override
  String get deleteList => 'စာရင်းဖျက်ရန်';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\" ကို ဖျက်ရန် သေချာပါသလား?';
  }

  @override
  String get cleanCompleted => 'ပြီးဆုံးသွားသောအရာများကို ရှင်းလင်းရန်';

  @override
  String get cleanConfirmation =>
      'ဤစာရင်းမှ ပြီးဆုံးသွားသောအရာအားလုံးကို ဖယ်ရှားမလား?';

  @override
  String get clean => 'ရှင်းလင်းရန်';

  @override
  String itemsCount(Object count) {
    return 'အရာ $count ခု';
  }

  @override
  String get settings => 'ဆက်တင်များ';

  @override
  String get theme => 'အပြင်အဆင်';

  @override
  String get system => 'စနစ်';

  @override
  String get light => 'အလင်း';

  @override
  String get dark => 'အမှောင်';

  @override
  String get close => 'ပိတ်ရန်';

  @override
  String get listExists => 'စာရင်းရှိပြီးသားဖြစ်သည်';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ရှိပြီးသားဖြစ်သည်';
  }

  @override
  String get addNewList => 'စာရင်းအသစ်ထည့်ရန်...';

  @override
  String get addNewItem => 'အရာအသစ်ထည့်ရန်...';

  @override
  String get language => 'ဘာသာစကား';

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
