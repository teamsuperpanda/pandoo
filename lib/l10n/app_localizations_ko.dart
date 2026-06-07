// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get appTitle => '판두';

  @override
  String get renameList => '목록 이름 바꾸기';

  @override
  String get listName => '목록 이름';

  @override
  String get cancel => '취소';

  @override
  String get rename => '이름 바꾸기';

  @override
  String get delete => '삭제';

  @override
  String get deleteList => '목록 삭제';

  @override
  String deleteConfirmation(Object listTitle) {
    return '정말로 \"$listTitle\"을(를) 삭제하시겠습니까?';
  }

  @override
  String get cleanCompleted => '완료된 항목 정리';

  @override
  String get cleanConfirmation => '이 목록에서 모든 완료된 항목을 제거하시겠습니까?';

  @override
  String get clean => '정리';

  @override
  String itemsCount(Object count) {
    return '항목 $count개';
  }

  @override
  String get settings => '설정';

  @override
  String get theme => '테마';

  @override
  String get system => '시스템';

  @override
  String get light => '라이트';

  @override
  String get dark => '다크';

  @override
  String get close => '닫기';

  @override
  String get listExists => '목록이 이미 존재함';

  @override
  String listExistsMessage(Object name) {
    return '\'$name\'이(가) 이미 존재합니다';
  }

  @override
  String get addNewList => '새 목록 추가...';

  @override
  String get addNewItem => '새 항목 추가...';

  @override
  String get language => '언어';

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
