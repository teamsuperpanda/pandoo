// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'パンドゥー';

  @override
  String get renameList => 'リスト名を変更';

  @override
  String get listName => 'リスト名';

  @override
  String get cancel => 'キャンセル';

  @override
  String get rename => '名前を変更';

  @override
  String get delete => '削除';

  @override
  String get deleteList => 'リストを削除';

  @override
  String deleteConfirmation(Object listTitle) {
    return '本当に「$listTitle」を削除しますか？';
  }

  @override
  String get cleanCompleted => '完了したアイテムを削除';

  @override
  String get cleanConfirmation => 'このリストから完了したアイテムをすべて削除しますか？';

  @override
  String get clean => '削除';

  @override
  String itemsCount(Object count) {
    return '$count個のアイテム';
  }

  @override
  String get settings => '設定';

  @override
  String get theme => 'テーマ';

  @override
  String get system => 'システム';

  @override
  String get light => 'ライト';

  @override
  String get dark => 'ダーク';

  @override
  String get close => '閉じる';

  @override
  String get listExists => 'リストが既に存在します';

  @override
  String listExistsMessage(Object name) {
    return '「$name」は既に存在します';
  }

  @override
  String get addNewList => '新しいリストを追加...';

  @override
  String get addNewItem => '新しいアイテムを追加...';

  @override
  String get language => '言語';

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
