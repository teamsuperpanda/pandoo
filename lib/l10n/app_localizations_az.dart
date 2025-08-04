// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Siyahını Yenidən Adlandır';

  @override
  String get listName => 'Siyahı Adı';

  @override
  String get cancel => 'Ləğv et';

  @override
  String get rename => 'Yenidən Adlandır';

  @override
  String get delete => 'Sil';

  @override
  String get deleteList => 'Siyahını Sil';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\" silmək istədiyinizə əminsiniz?';
  }

  @override
  String get cleanCompleted => 'Tamamlanmış Elementləri Təmizlə';

  @override
  String get cleanConfirmation =>
      'Bu siyahıdan bütün tamamlanmış elementlər silinsin?';

  @override
  String get clean => 'Təmizlə';

  @override
  String itemsCount(Object count) {
    return '$count element';
  }

  @override
  String get settings => 'Parametrlər';

  @override
  String get theme => 'Mövzu';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'İşıqlı';

  @override
  String get dark => 'Qaranlıq';

  @override
  String get close => 'Bağla';

  @override
  String get listExists => 'Siyahı Artıq Mövcuddur';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' artıq mövcuddur';
  }

  @override
  String get addNewList => 'Yeni siyahı əlavə et...';

  @override
  String get addNewItem => 'Yeni element əlavə et...';

  @override
  String get language => 'Dil';
}
