// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Filipino Pilipino (`fil`).
class AppLocalizationsFil extends AppLocalizations {
  AppLocalizationsFil([String locale = 'fil']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Palitan ang Pangalan ng Listahan';

  @override
  String get listName => 'Pangalan ng Listahan';

  @override
  String get cancel => 'Kanselahin';

  @override
  String get rename => 'Palitan ang Pangalan';

  @override
  String get delete => 'Burahin';

  @override
  String get deleteList => 'Burahin ang Listahan';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Sigurado ka bang gusto mong burahin ang \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Linisin ang mga Nakumpletong Item';

  @override
  String get cleanConfirmation =>
      'Alisin lahat ng nakumpletong item mula sa listahang ito?';

  @override
  String get clean => 'Linisin';

  @override
  String itemsCount(Object count) {
    return '$count na item';
  }

  @override
  String get settings => 'Mga Setting';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'System';

  @override
  String get light => 'Maliwanag';

  @override
  String get dark => 'Madilim';

  @override
  String get close => 'Isara';

  @override
  String get listExists => 'Mayroon ng Listahan';

  @override
  String listExistsMessage(Object name) {
    return 'Mayroon na ng \'$name\'';
  }

  @override
  String get addNewList => 'Magdagdag ng bagong listahan...';

  @override
  String get addNewItem => 'Magdagdag ng bagong item...';

  @override
  String get language => 'Wika';
}
