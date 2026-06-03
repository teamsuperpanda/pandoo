// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Albanian (`sq`).
class AppLocalizationsSq extends AppLocalizations {
  AppLocalizationsSq([String locale = 'sq']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Riemërto Listën';

  @override
  String get listName => 'Emri i Listës';

  @override
  String get cancel => 'Anulo';

  @override
  String get rename => 'Riemërto';

  @override
  String get delete => 'Fshi';

  @override
  String get deleteList => 'Fshi Listën';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'A jeni i sigurt që dëshironi të fshini \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Pastro Artikujt e Përfunduar';

  @override
  String get cleanConfirmation =>
      'Të hiqen të gjithë artikujt e përfunduar nga kjo listë?';

  @override
  String get clean => 'Pastro';

  @override
  String itemsCount(Object count) {
    return '$count artikuj';
  }

  @override
  String get settings => 'Cilësimet';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistemi';

  @override
  String get light => 'E Lehtë';

  @override
  String get dark => 'E Errët';

  @override
  String get close => 'Mbyll';

  @override
  String get listExists => 'Lista Ekziston';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' tashmë ekziston';
  }

  @override
  String get addNewList => 'Shto listë të re...';

  @override
  String get addNewItem => 'Shto artikull të ri...';

  @override
  String get language => 'Gjuha';

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
