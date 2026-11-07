import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/services/settings_service.dart';
import 'package:pandoo/widgets/shared/app_snackbar.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late ThemeMode _themeMode;
  late String _languageCode;
  late bool _fabAnimation;

  @override
  void initState() {
    super.initState();
    final service = SettingsService();
    _themeMode = service.getThemeMode();
    _languageCode = _currentLanguageTag(service.getLocale());
    _fabAnimation = service.getFabAnimation();
  }

  static String _currentLanguageTag(Locale? locale) {
    if (locale == null) return 'system';
    final country = locale.countryCode;
    return country == null || country.isEmpty
        ? locale.languageCode
        : '${locale.languageCode}-$country';
  }

  /// Applies the change, writes it, and reverts the control plus shows an
  /// error when the write fails.
  Future<void> _persist({
    required Future<void> Function() write,
    required VoidCallback revert,
  }) async {
    try {
      await write();
    } on Object catch (error) {
      debugPrint('SettingsDialog failed to save: $error');
      if (!mounted) return;
      revert();
      showErrorSnackBar(
        context,
        title: context.l10n.settingsErrorTitle,
        message: context.l10n.settingsErrorMessage,
      );
    }
  }

  void _onThemeChanged(ThemeMode? value) {
    if (value == null) return;
    final previous = _themeMode;
    setState(() => _themeMode = value);
    unawaited(
      _persist(
        write: () => SettingsService().setThemeMode(value),
        revert: () => setState(() => _themeMode = previous),
      ),
    );
  }

  void _onLanguageChanged(String? languageCode) {
    if (languageCode == null) return;
    final previous = _languageCode;
    final locale = languageCode == 'system'
        ? null
        : Locale(
            languageCode.split('-').first,
            languageCode.split('-').length > 1
                ? languageCode.split('-')[1]
                : null,
          );
    setState(() => _languageCode = languageCode);
    unawaited(
      _persist(
        write: () => SettingsService().setLocale(locale),
        revert: () => setState(() => _languageCode = previous),
      ),
    );
  }

  void _onFabAnimationChanged(bool value) {
    final previous = _fabAnimation;
    setState(() => _fabAnimation = value);
    unawaited(
      _persist(
        write: () => SettingsService().setFabAnimation(value),
        revert: () => setState(() => _fabAnimation = previous),
      ),
    );
  }

  static const Map<String, String> _supportedLanguages = {
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
    'es': 'Español',
    'et': 'Eesti',
    'eu': 'Euskara',
    'fa': 'فارسی',
    'fi': 'Suomi',
    'fil': 'Filipino',
    'fr': 'Français',
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
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Semantics(header: true, child: Text(context.l10n.settings)),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Section
            Semantics(
              header: true,
              child: Text(
                context.l10n.theme,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Semantics(
              child: DropdownButtonFormField<ThemeMode>(
                key: ValueKey('theme-$_themeMode'),
                initialValue: _themeMode,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text(context.l10n.system),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(context.l10n.light),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(context.l10n.dark),
                  ),
                ],
                onChanged: _onThemeChanged,
              ),
            ),
            const SizedBox(height: 24),

            // Language Section
            Semantics(
              header: true,
              child: Text(
                context.l10n.language,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Semantics(
              child: DropdownButtonFormField<String>(
                key: ValueKey('language-$_languageCode'),
                initialValue: _languageCode,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items: _supportedLanguages.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.key,
                    child: Text(
                      entry.key == 'system' ? context.l10n.system : entry.value,
                    ),
                  );
                }).toList(),
                onChanged: _onLanguageChanged,
              ),
            ),
            const SizedBox(height: 24),

            // Add Button Section
            Semantics(
              header: true,
              child: Text(
                context.l10n.animateAddButton,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Semantics(
              button: true,
              label: context.l10n.animateAddButton,
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(context.l10n.animateAddButton),
                value: _fabAnimation,
                onChanged: _onFabAnimationChanged,
              ),
            ),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      actions: [
        Semantics(
          button: true,
          label: context.l10n.close,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.close),
          ),
        ),
      ],
    );
  }
}
