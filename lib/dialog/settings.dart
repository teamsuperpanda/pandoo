import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({
    required this.onThemeChanged,
    required this.currentThemeMode,
    required this.onLanguageChanged,
    required this.currentLocale,
    this.analyticsEnabled,
    this.onAnalyticsChanged,
    this.fabAnimation,
    this.onFabAnimationChanged,
    super.key,
  });

  final void Function(ThemeMode) onThemeChanged;
  final ThemeMode currentThemeMode;
  final void Function(Locale?) onLanguageChanged;
  final Locale? currentLocale;
  final bool? analyticsEnabled;
  final void Function(bool)? onAnalyticsChanged;
  final bool? fabAnimation;
  final void Function(bool)? onFabAnimationChanged;

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late bool _analyticsEnabled;
  late bool _fabAnimation;

  @override
  void initState() {
    super.initState();
    _analyticsEnabled = widget.analyticsEnabled ?? true;
    _fabAnimation = widget.fabAnimation ?? true;
  }

  final Map<String, String> _supportedLanguages = {
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

  String _getCurrentLanguageCode() {
    if (widget.currentLocale == null) return 'system';
    return widget.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Semantics(
        header: true,
        child: Text(context.l10n.settings),
      ),
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
                initialValue: widget.currentThemeMode,
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    widget.onThemeChanged(value);
                  }
                },
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
                initialValue: _getCurrentLanguageCode(),
                isExpanded: true,
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                items: _supportedLanguages.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.key,
                    child: Text(entry.value),
                  );
                }).toList(),
                onChanged: (String? languageCode) {
                  if (languageCode != null) {
                    final locale =
                        languageCode == 'system' ? null : Locale(languageCode);
                    widget.onLanguageChanged(locale);
                  }
                },
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
                onChanged: (value) {
                  setState(() => _fabAnimation = value);
                  widget.onFabAnimationChanged?.call(value);
                },
              ),
            ),
            const SizedBox(height: 24),

            // Analytics Section
            Semantics(
              header: true,
              child: Text(
                context.l10n.analytics,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Semantics(
              button: true,
              label: context.l10n.enableAnalytics,
              child: SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(context.l10n.enableAnalytics),
                value: _analyticsEnabled,
                onChanged: (value) {
                  setState(() => _analyticsEnabled = value);
                  widget.onAnalyticsChanged?.call(value);
                },
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
