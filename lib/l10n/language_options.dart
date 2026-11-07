import 'dart:ui';

/// Language options shown in settings. Keys are BCP-47 tags, including
/// regional variants; values are the native display names.
///
/// `system` is handled by the settings UI and is not a real locale.
const Map<String, String> languageOptions = {
  'system': 'System',
  'af': 'Afrikaans',
  'am': 'አማርኛ',
  'ar': 'العربية',
  'az': 'Azərbaycan',
  'be': 'Беларуская',
  'bg': 'Български',
  'bn': 'বাংলা',
  'ca': 'Català',
  'cs': 'Čeština',
  'da': 'Dansk',
  'de': 'Deutsch',
  'el': 'Ελληνικά',
  'en': 'English',
  'en-AU': 'English (Australia)',
  'en-CA': 'English (Canada)',
  'en-GB': 'English (United Kingdom)',
  'en-IN': 'English (India)',
  'en-SG': 'English (Singapore)',
  'en-ZA': 'English (South Africa)',
  'es': 'Español',
  'es-419': 'Español (Latinoamérica)',
  'et': 'Eesti',
  'eu': 'Euskara',
  'fa': 'فارسی',
  'fi': 'Suomi',
  'fil': 'Filipino',
  'fr': 'Français',
  'fr-CA': 'Français (Canada)',
  'fr-FR': 'Français (France)',
  'gl': 'Galego',
  'gu': 'ગુજરાતી',
  'he': 'עברית',
  'hi': 'हिन्दी',
  'hr': 'Hrvatski',
  'hu': 'Magyar',
  'hy': 'Հայերեն',
  'id': 'Indonesia',
  'it': 'Italiano',
  'ja': '日本語',
  'ka': 'ქართული',
  'kk': 'Қазақ',
  'kn': 'ಕನ್ನಡ',
  'ko': '한국어',
  'lt': 'Lietuvių',
  'lv': 'Latviešu',
  'mk': 'Македонски',
  'ml': 'മലയാളം',
  'mn': 'Монгол',
  'mr': 'मराठी',
  'ms': 'Bahasa Melayu',
  'my': 'မြန်မာဘာသာ',
  'nb': 'Norsk Bokmål',
  'nl': 'Nederlands',
  'pl': 'Polski',
  'pt': 'Português',
  'pt-BR': 'Português (Brasil)',
  'pt-PT': 'Português (Portugal)',
  'ro': 'Română',
  'ru': 'Русский',
  'sk': 'Slovenčina',
  'sl': 'Slovenščina',
  'sq': 'Shqip',
  'sr': 'Српски',
  'sv': 'Svenska',
  'ta': 'தமிழ்',
  'te': 'తెలుగు',
  'th': 'ไทย',
  'tr': 'Türkçe',
  'uk': 'Українська',
  'ur': 'اردو',
  'vi': 'Tiếng Việt',
  'zh': '中文',
  'zh-CN': '中文 (简体, 中国)',
  'zh-HK': '中文 (繁體, 香港)',
  'zh-TW': '中文 (繁體, 台灣)',
};

/// Parses a settings tag such as `pt-BR` into a [Locale].
Locale localeFromTag(String tag) {
  final parts = tag.split('-');
  if (parts.length == 1) return Locale(parts.first);
  return Locale.fromSubtags(languageCode: parts.first, countryCode: parts[1]);
}

/// Formats a [Locale] as a settings tag, matching [languageOptions] keys.
String tagFromLocale(Locale locale) {
  final country = locale.countryCode;
  return country == null || country.isEmpty
      ? locale.languageCode
      : '${locale.languageCode}-$country';
}
