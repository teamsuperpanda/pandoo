// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Amharic (`am`).
class AppLocalizationsAm extends AppLocalizations {
  AppLocalizationsAm([String locale = 'am']) : super(locale);

  @override
  String get appTitle => 'ፓንዱ';

  @override
  String get renameList => 'ዝርዝሩን እንደገና ሰይም';

  @override
  String get listName => 'የዝርዝር ስም';

  @override
  String get cancel => 'ሰርዝ';

  @override
  String get rename => 'እንደገና ሰይም';

  @override
  String get delete => 'ሰርዝ';

  @override
  String get deleteList => 'ዝርዝሩን ሰርዝ';

  @override
  String deleteConfirmation(Object listTitle) {
    return '\"$listTitle\"ን መሰረዝ እንደሚፈልጉ እርግጠኛ ነዎት?';
  }

  @override
  String get cleanCompleted => 'የተጠናቀቁ ንጥሎችን አጽዳ';

  @override
  String get cleanConfirmation => 'ከዚህ ዝርዝር ሁሉንም የተጠናቀቁ ንጥሎችን ማስወገድ?';

  @override
  String get clean => 'አጽዳ';

  @override
  String itemsCount(Object count) {
    return '$count ንጥሎች';
  }

  @override
  String get settings => 'ቅንብሮች';

  @override
  String get theme => 'ገጽታ';

  @override
  String get system => 'ሲስተም';

  @override
  String get light => 'ብርሃን';

  @override
  String get dark => 'ጨለማ';

  @override
  String get close => 'ዝጋ';

  @override
  String get listExists => 'ዝርዝሩ አስቀድሞ አለ';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\' አስቀድሞ አለ';
  }

  @override
  String get addNewList => 'አዲስ ዝርዝር ጨምር...';

  @override
  String get addNewItem => 'አዲስ ንጥል ጨምር...';

  @override
  String get language => 'ቋንቋ';

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
