// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'பாண்டூ';

  @override
  String get renameList => 'பட்டியலை மறுபெயரிடு';

  @override
  String get listName => 'பட்டியல் பெயர்';

  @override
  String get cancel => 'ரத்து செய்';

  @override
  String get rename => 'மறுபெயரிடு';

  @override
  String get delete => 'நீக்கு';

  @override
  String get deleteList => 'பட்டியலை நீக்கு';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\" ஐ நீக்க விரும்புகிறீர்களா?';
  }

  @override
  String get cleanCompleted => 'முடிந்த உருப்படிகளை அழி';

  @override
  String get cleanConfirmation =>
      'இந்த பட்டியலில் உள்ள அனைத்து முடிந்த உருப்படிகளையும் நீக்கவா?';

  @override
  String get clean => 'அழி';

  @override
  String itemsCount(Object count) {
    return '$count உருப்படிகள்';
  }

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get theme => 'தீம்';

  @override
  String get system => 'சிஸ்டம்';

  @override
  String get light => 'வெளிச்சம்';

  @override
  String get dark => 'இருள்';

  @override
  String get close => 'மூடு';

  @override
  String get listExists => 'பட்டியல் ஏற்கனவே உள்ளது';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ஏற்கனவே உள்ளது';
  }

  @override
  String get addNewList => 'புதிய பட்டியலைச் சேர்...';

  @override
  String get addNewItem => 'புதிய உருப்படியைச் சேர்...';

  @override
  String get language => 'மொழி';
}
