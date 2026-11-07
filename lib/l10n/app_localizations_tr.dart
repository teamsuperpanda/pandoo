// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => 'Listeyi Yeniden Adlandır';

  @override
  String get listName => 'Liste Adı';

  @override
  String get cancel => 'İptal';

  @override
  String get rename => 'Yeniden Adlandır';

  @override
  String get delete => 'Sil';

  @override
  String get deleteList => 'Listeyi Sil';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\" öğesini silmek istediğinizden emin misiniz?';
  }

  @override
  String get cleanCompleted => 'Tamamlananları Temizle';

  @override
  String get cleanConfirmation => 'Bu listeden tüm tamamlanan öğeleri kaldır?';

  @override
  String get clean => 'Temizle';

  @override
  String itemsCount(Object count) {
    return '$count öğe';
  }

  @override
  String get settings => 'Ayarlar';

  @override
  String get theme => 'Tema';

  @override
  String get system => 'Sistem';

  @override
  String get light => 'Açık';

  @override
  String get dark => 'Koyu';

  @override
  String get close => 'Kapat';

  @override
  String get listExists => 'Liste Zaten Var';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' zaten var';
  }

  @override
  String get addNewList => 'Yeni liste ekle...';

  @override
  String get addNewItem => 'Yeni öğe ekle...';

  @override
  String get language => 'Dil';

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

  @override
  String get reorderList => 'Reorder list';

  @override
  String get pinnedList => 'Pinned list';

  @override
  String get moreOptions => 'More options';

  @override
  String get startupErrorTitle => 'Local storage could not be opened';

  @override
  String get startupErrorMessage =>
      'Your data is still on this device. Retry first. If retrying keeps failing, copy the diagnostics or reset local data as a last resort.';

  @override
  String get retry => 'Retry';

  @override
  String get copyDiagnostics => 'Copy diagnostics';

  @override
  String get diagnosticsCopied => 'Diagnostics copied';

  @override
  String get resetLocalData => 'Reset local data';

  @override
  String get resetConfirmTitle => 'Reset local data?';

  @override
  String get resetConfirmMessage =>
      'This deletes every list and setting on this device and cannot be undone. Copy the diagnostics first if you want help recovering the data.';
}
