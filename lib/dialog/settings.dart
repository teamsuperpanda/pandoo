import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

class SettingsDialog extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  final ThemeMode currentThemeMode;
  final Function(Locale?) onLanguageChanged;
  final Locale? currentLocale;

  const SettingsDialog({
    super.key,
    required this.onThemeChanged,
    required this.currentThemeMode,
    required this.onLanguageChanged,
    required this.currentLocale,
  });

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  final Map<String, String> _supportedLanguages = {
    'system': 'System',
    'en': 'English',
    'de': 'Deutsch',
    'es': 'Español',
    'fr': 'Français',
    'it': 'Italiano',
    'ja': '日本語',
    'pt': 'Português',
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
      title: Text(context.l10n.settings),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Section
            Text(
              context.l10n.theme,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<ThemeMode>(
              value: widget.currentThemeMode,
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
                  setState(() {
                    widget.onThemeChanged(value);
                  });
                }
              },
            ),
            const SizedBox(height: 24),

            // Language Section
            Text(
              'Language',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _getCurrentLanguageCode(),
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
            const SizedBox(height: 8),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(context.l10n.close),
        ),
      ],
    );
  }
}
