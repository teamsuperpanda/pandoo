// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಪಾಂಡೂ';

  @override
  String get renameList => 'ಪಟ್ಟಿ ಹೆಸರನ್ನು ಬದಲಾಯಿಸಿ';

  @override
  String get listName => 'ಪಟ್ಟಿಯ ಹೆಸರು';

  @override
  String get cancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get rename => 'ಮರುಹೆಸರಿಸಿ';

  @override
  String get delete => 'ಅಳಿಸಿ';

  @override
  String get deleteList => 'ಪಟ್ಟಿಯನ್ನು ಅಳಿಸಿ';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'ನೀವು ಖಚಿತವಾಗಿ \"$listTitle\" ಅನ್ನು ಅಳಿಸಲು ಬಯಸುವಿರಾ?';
  }

  @override
  String get cleanCompleted => 'ಪೂರ್ಣಗೊಂಡ ಐಟಂಗಳನ್ನು ತೆರವುಗೊಳಿಸಿ';

  @override
  String get cleanConfirmation =>
      'ಈ ಪಟ್ಟಿಯಿಂದ ಎಲ್ಲಾ ಪೂರ್ಣಗೊಂಡ ಐಟಂಗಳನ್ನು ತೆಗೆದುಹಾಕುವುದೇ?';

  @override
  String get clean => 'ತೆರವುಗೊಳಿಸಿ';

  @override
  String itemsCount(Object count) {
    return '$count ಐಟಂಗಳು';
  }

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get theme => 'ಥೀಮ್';

  @override
  String get system => 'ಸಿಸ್ಟಮ್';

  @override
  String get light => 'ಬೆಳಕಿನ';

  @override
  String get dark => 'ಗಾಢ';

  @override
  String get close => 'ಮುಚ್ಚಿ';

  @override
  String get listExists => 'ಪಟ್ಟಿ ಈಗಾಗಲೇ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' ಈಗಾಗಲೇ ಅಸ್ತಿತ್ವದಲ್ಲಿದೆ';
  }

  @override
  String get addNewList => 'ಹೊಸ ಪಟ್ಟಿಯನ್ನು ಸೇರಿಸಿ...';

  @override
  String get addNewItem => 'ಹೊಸ ಐಟಂ ಸೇರಿಸಿ...';

  @override
  String get language => 'ಭಾಷೆ';

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
