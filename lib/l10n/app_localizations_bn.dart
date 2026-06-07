// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'পান্ডু';

  @override
  String get renameList => 'তালিকার নাম পরিবর্তন করুন';

  @override
  String get listName => 'তালিকার নাম';

  @override
  String get cancel => 'বাতিল';

  @override
  String get rename => 'নাম পরিবর্তন';

  @override
  String get delete => 'মুছুন';

  @override
  String get deleteList => 'তালিকা মুছুন';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'আপনি কি নিশ্চিত যে আপনি \"$listTitle\" মুছতে চান?';
  }

  @override
  String get cleanCompleted => 'সম্পন্ন আইটেমগুলি পরিষ্কার করুন';

  @override
  String get cleanConfirmation => 'এই তালিকা থেকে সমস্ত সম্পন্ন আইটেম সরাবেন?';

  @override
  String get clean => 'পরিষ্কার';

  @override
  String itemsCount(Object count) {
    return '$countটি আইটেম';
  }

  @override
  String get settings => 'সেটিংস';

  @override
  String get theme => 'থিম';

  @override
  String get system => 'সিস্টেম';

  @override
  String get light => 'লাইট';

  @override
  String get dark => 'ডার্ক';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get listExists => 'তালিকা ইতিমধ্যে বিদ্যমান';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ইতিমধ্যে বিদ্যমান';
  }

  @override
  String get addNewList => 'নতুন তালিকা যোগ করুন...';

  @override
  String get addNewItem => 'নতুন আইটেম যোগ করুন...';

  @override
  String get language => 'ভাষা';

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
