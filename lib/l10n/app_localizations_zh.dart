// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Pandoo';

  @override
  String get renameList => '重命名列表';

  @override
  String get listName => '列表名称';

  @override
  String get cancel => '取消';

  @override
  String get rename => '重命名';

  @override
  String get delete => '删除';

  @override
  String get deleteList => '删除列表';

  @override
  String deleteConfirmation(Object listTitle) {
    return '确定要删除 \"$listTitle\" 吗？';
  }

  @override
  String get cleanCompleted => '清除已完成项目';

  @override
  String get cleanConfirmation => '是否删除此列表中的所有已完成项目？';

  @override
  String get clean => '清除';

  @override
  String itemsCount(Object count) {
    return '$count 个项目';
  }

  @override
  String get settings => '设置';

  @override
  String get theme => '主题';

  @override
  String get system => '系统';

  @override
  String get light => '浅色';

  @override
  String get dark => '深色';

  @override
  String get close => '关闭';

  @override
  String get listExists => '列表已存在';

  @override
  String listExistsMessage(Object name) {
    return '\"$name\" 已存在';
  }

  @override
  String get addNewList => '添加新列表...';

  @override
  String get addNewItem => '添加新项目...';

  @override
  String get language => '语言';

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

/// The translations for Chinese, as used in China (`zh_CN`).
class AppLocalizationsZhCn extends AppLocalizationsZh {
  AppLocalizationsZhCn() : super('zh_CN');

  @override
  String get appTitle => '潘都';

  @override
  String get renameList => '重命名列表';

  @override
  String get listName => '列表名称';

  @override
  String get cancel => '取消';

  @override
  String get rename => '重命名';

  @override
  String get delete => '删除';

  @override
  String get deleteList => '删除列表';

  @override
  String deleteConfirmation(Object listTitle) {
    return '您确定要删除\"$listTitle\"吗？';
  }

  @override
  String get cleanCompleted => '清除已完成项目';

  @override
  String get cleanConfirmation => '从此列表中删除所有已完成的项目？';

  @override
  String get clean => '清除';

  @override
  String itemsCount(Object count) {
    return '$count个项目';
  }

  @override
  String get settings => '设置';

  @override
  String get theme => '主题';

  @override
  String get system => '系统';

  @override
  String get light => '浅色';

  @override
  String get dark => '深色';

  @override
  String get close => '关闭';

  @override
  String get listExists => '列表已存在';

  @override
  String listExistsMessage(Object name) {
    return '\"$name\"已存在';
  }

  @override
  String get addNewList => '添加新列表...';

  @override
  String get addNewItem => '添加新项目...';

  @override
  String get language => '语言';

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

/// The translations for Chinese, as used in Hong Kong (`zh_HK`).
class AppLocalizationsZhHk extends AppLocalizationsZh {
  AppLocalizationsZhHk() : super('zh_HK');

  @override
  String get appTitle => '潘都';

  @override
  String get renameList => '重命名清單';

  @override
  String get listName => '清單名稱';

  @override
  String get cancel => '取消';

  @override
  String get rename => '重命名';

  @override
  String get delete => '刪除';

  @override
  String get deleteList => '刪除清單';

  @override
  String deleteConfirmation(Object listTitle) {
    return '你確定要刪除「$listTitle」嗎？';
  }

  @override
  String get cleanCompleted => '清除已完成項目';

  @override
  String get cleanConfirmation => '從此清單中移除所有已完成的項目？';

  @override
  String get clean => '清除';

  @override
  String itemsCount(Object count) {
    return '$count 個項目';
  }

  @override
  String get settings => '設定';

  @override
  String get theme => '主題';

  @override
  String get system => '系統';

  @override
  String get light => '淺色';

  @override
  String get dark => '深色';

  @override
  String get close => '關閉';

  @override
  String get listExists => '清單已存在';

  @override
  String listExistsMessage(Object name) {
    return '「$name」已存在';
  }

  @override
  String get addNewList => '新增清單...';

  @override
  String get addNewItem => '新增項目...';

  @override
  String get language => '語言';

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

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get appTitle => '潘都';

  @override
  String get renameList => '重新命名清單';

  @override
  String get listName => '清單名稱';

  @override
  String get cancel => '取消';

  @override
  String get rename => '重新命名';

  @override
  String get delete => '刪除';

  @override
  String get deleteList => '刪除清單';

  @override
  String deleteConfirmation(Object listTitle) {
    return '您確定要刪除\"$listTitle\"嗎？';
  }

  @override
  String get cleanCompleted => '清除已完成項目';

  @override
  String get cleanConfirmation => '從此清單中移除所有已完成的項目？';

  @override
  String get clean => '清除';

  @override
  String itemsCount(Object count) {
    return '$count個項目';
  }

  @override
  String get settings => '設定';

  @override
  String get theme => '主題';

  @override
  String get system => '系統';

  @override
  String get light => '淺色';

  @override
  String get dark => '深色';

  @override
  String get close => '關閉';

  @override
  String get listExists => '清單已存在';

  @override
  String listExistsMessage(Object name) {
    return '\"$name\"已存在';
  }

  @override
  String get addNewList => '新增清單...';

  @override
  String get addNewItem => '新增項目...';

  @override
  String get language => '語言';

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
