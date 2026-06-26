// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Namakan Semula Senarai';

  @override
  String get listName => 'Nama Senarai';

  @override
  String get cancel => 'Batal';

  @override
  String get rename => 'Namakan Semula';

  @override
  String get delete => 'Padam';

  @override
  String get deleteList => 'Padam Senarai';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Adakah anda pasti mahu memadamkan \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Bersihkan Item Selesai';

  @override
  String get cleanConfirmation =>
      'Buang semua item yang telah selesai dari senarai ini?';

  @override
  String get clean => 'Bersihkan';

  @override
  String itemsCount(Object count) {
    return '$count item';
  }

  @override
  String get settings => 'Tetapan';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'Cerah';

  @override
  String get dark => 'Gelap';

  @override
  String get close => 'Tutup';

  @override
  String get listExists => 'Senarai Sudah Wujud';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' sudah wujud';
  }

  @override
  String get addNewList => 'Tambah senarai baharu...';

  @override
  String get addNewItem => 'Tambah item baharu...';

  @override
  String get language => 'Bahasa';

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
