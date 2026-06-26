// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Ubah Nama Daftar';

  @override
  String get listName => 'Nama Daftar';

  @override
  String get cancel => 'Batal';

  @override
  String get rename => 'Ubah Nama';

  @override
  String get delete => 'Hapus';

  @override
  String get deleteList => 'Hapus Daftar';

  @override
  String deleteConfirmation(Object listTitle) {
    return 'Apakah Anda yakin ingin menghapus \"$listTitle\"?';
  }

  @override
  String get cleanCompleted => 'Bersihkan Item Selesai';

  @override
  String get cleanConfirmation =>
      'Hapus semua item yang telah selesai dari daftar ini?';

  @override
  String get clean => 'Bersihkan';

  @override
  String itemsCount(Object count) {
    return '$count item';
  }

  @override
  String get settings => 'Pengaturan';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'Terang';

  @override
  String get dark => 'Gelap';

  @override
  String get close => 'Tutup';

  @override
  String get listExists => 'Daftar Sudah Ada';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' sudah ada';
  }

  @override
  String get addNewList => 'Tambah daftar baru...';

  @override
  String get addNewItem => 'Tambah item baru...';

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
