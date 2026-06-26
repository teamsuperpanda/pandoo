// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'పాండూ';

  @override
  String get renameList => 'జాబితా పేరు మార్చు';

  @override
  String get listName => 'జాబితా పేరు';

  @override
  String get cancel => 'రద్దు చేయి';

  @override
  String get rename => 'పేరు మార్చు';

  @override
  String get delete => 'తొలగించు';

  @override
  String get deleteList => 'జాబితాను తొలగించు';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'మీరు నిజంగా \"$listTitle\"ని తొలగించాలనుకుంటున్నారా?';
  }

  @override
  String get cleanCompleted => 'పూర్తయిన అంశాలను తొలగించు';

  @override
  String get cleanConfirmation =>
      'ఈ జాబితా నుండి పూర్తయిన అన్ని అంశాలను తొలగించాలా?';

  @override
  String get clean => 'శుభ్రం చేయి';

  @override
  String itemsCount(Object count) {
    return '$count అంశాలు';
  }

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get theme => 'థీమ్';

  @override
  String get system => 'సిస్టమ్';

  @override
  String get light => 'లైట్';

  @override
  String get dark => 'డార్క్';

  @override
  String get close => 'మూసివేయి';

  @override
  String get listExists => 'జాబితా ఇప్పటికే ఉంది';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ఇప్పటికే ఉంది';
  }

  @override
  String get addNewList => 'కొత్త జాబితాను జోడించు...';

  @override
  String get addNewItem => 'కొత్త అంశాన్ని జోడించు...';

  @override
  String get language => 'భాష';

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
