// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'പാണ്ഡു';

  @override
  String get renameList => 'ലിസ്റ്റിന്റെ പേര് മാറ്റുക';

  @override
  String get listName => 'ലിസ്റ്റിന്റെ പേര്';

  @override
  String get cancel => 'റദ്ദാക്കുക';

  @override
  String get rename => 'പേര് മാറ്റുക';

  @override
  String get delete => 'ഇല്ലാതാക്കുക';

  @override
  String get deleteList => 'ലിസ്റ്റ് ഇല്ലാതാക്കുക';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\" ഇല്ലാതാക്കണമെന്ന് തീർച്ചയാണോ?';
  }

  @override
  String get cleanCompleted => 'പൂർത്തിയായ ഇനങ്ങൾ മായ്ക്കുക';

  @override
  String get cleanConfirmation =>
      'ഈ ലിസ്റ്റിൽ നിന്ന് എല്ലാ പൂർത്തിയായ ഇനങ്ങളും നീക്കം ചെയ്യണോ?';

  @override
  String get clean => 'മായ്ക്കുക';

  @override
  String itemsCount(Object count) {
    return '$count ഇനങ്ങൾ';
  }

  @override
  String get settings => 'ക്രമീകരണങ്ങൾ';

  @override
  String get theme => 'തീം';

  @override
  String get system => 'സിസ്റ്റം';

  @override
  String get light => 'വെളിച്ചം';

  @override
  String get dark => 'ഇരുട്ട്';

  @override
  String get close => 'അടയ്ക്കുക';

  @override
  String get listExists => 'ലിസ്റ്റ് നിലവിലുണ്ട്';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' നിലവിലുണ്ട്';
  }

  @override
  String get addNewList => 'പുതിയ ലിസ്റ്റ് ചേർക്കുക...';

  @override
  String get addNewItem => 'പുതിയ ഇനം ചേർക്കുക...';

  @override
  String get language => 'ഭാഷ';

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
