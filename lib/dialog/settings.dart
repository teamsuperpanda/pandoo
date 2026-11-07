import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/l10n/language_options.dart';
import 'package:pandoo/services/settings_service.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  late bool _fabAnimation;

  @override
  void initState() {
    super.initState();
    _fabAnimation = SettingsService().getFabAnimation();
  }

  Future<void> _persistTheme(ThemeMode themeMode) async {
    try {
      await SettingsService().setThemeMode(themeMode);
    } on Object catch (error) {
      debugPrint('Failed to persist theme setting: $error');
    }
  }

  Future<void> _persistLanguage(Locale? locale) async {
    try {
      await SettingsService().setLocale(locale);
    } on Object catch (error) {
      debugPrint('Failed to persist language setting: $error');
    }
  }

  Future<void> _persistFabAnimation(bool value) async {
    try {
      await SettingsService().setFabAnimation(value);
    } on Object catch (error) {
      debugPrint('Failed to persist add button animation setting: $error');
    }
  }

  String _getCurrentLanguageCode() {
    final locale = SettingsService().getLocale();
    return locale == null ? 'system' : tagFromLocale(locale);
  }

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
                initialValue: SettingsService().getThemeMode(),
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
                onChanged: (ThemeMode? value) {
                  if (value != null) {
                    unawaited(_persistTheme(value));
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
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                items: languageOptions.entries.map((entry) {
                  return DropdownMenuItem<String>(
                    value: entry.key,
                    child: Text(
                      entry.key == 'system' ? context.l10n.system : entry.value,
                    ),
                  );
                }).toList(),
                onChanged: (String? languageCode) {
                  if (languageCode != null) {
                    final locale = languageCode == 'system'
                        ? null
                        : localeFromTag(languageCode);
                    unawaited(_persistLanguage(locale));
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
                  unawaited(_persistFabAnimation(value));
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
