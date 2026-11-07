// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kazakh (`kk`).
class AppLocalizationsKk extends AppLocalizations {
  AppLocalizationsKk([String locale = 'kk']) : super(locale);

  @override
  String get appTitle => 'Пандоо';

  @override
  String get renameList => 'Тізім Атын Өзгерту';

  @override
  String get listName => 'Тізім Аты';

  @override
  String get cancel => 'Бас Тарту';

  @override
  String get rename => 'Атын Өзгерту';

  @override
  String get delete => 'Жою';

  @override
  String get deleteList => 'Тізімді Жою';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\" тізімін жойғыңыз келетініне сенімдісіз бе?';
  }

  @override
  String get cleanCompleted => 'Аяқталған Элементтерді Тазалау';

  @override
  String get cleanConfirmation =>
      'Осы тізімнен барлық аяқталған элементтерді жою керек пе?';

  @override
  String get clean => 'Тазалау';

  @override
  String itemsCount(Object count) {
    return '$count элемент';
  }

  @override
  String get settings => 'Параметрлер';

  @override
  String get theme => 'Тақырып';

  @override
  String get system => 'Жүйе';

  @override
  String get light => 'Ашық';

  @override
  String get dark => 'Қараңғы';

  @override
  String get close => 'Жабу';

  @override
  String get listExists => 'Тізім Әлдеқашан Бар';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' әлдеқашан бар';
  }

  @override
  String get addNewList => 'Жаңа тізім қосу...';

  @override
  String get addNewItem => 'Жаңа элемент қосу...';

  @override
  String get language => 'Тіл';

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
