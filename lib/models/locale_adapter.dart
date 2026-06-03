import 'dart:ui';

import 'package:hive/hive.dart';

class LocaleAdapter extends TypeAdapter<Locale> {
  @override
  final int typeId = 101;

  @override
  Locale read(BinaryReader reader) {
    final languageCode = reader.readString();
    final countryCode = reader.readString();
    if (countryCode.isEmpty) return Locale(languageCode);
    return Locale(languageCode, countryCode);
  }

  @override
  void write(BinaryWriter writer, Locale obj) {
    writer.writeString(obj.languageCode);
    writer.writeString(obj.countryCode ?? '');
  }
}
