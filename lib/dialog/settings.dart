import 'package:flutter/material.dart';

class SettingsDialog extends StatelessWidget {
  final Function(ThemeMode) onThemeChanged;

  const SettingsDialog({
    super.key,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Theme',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          RadioListTile(
            title: const Text('System'),
            value: ThemeMode.system,
            groupValue: Theme.of(context).brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                onThemeChanged(value);
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile(
            title: const Text('Light'),
            value: ThemeMode.light,
            groupValue: Theme.of(context).brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                onThemeChanged(value);
                Navigator.pop(context);
              }
            },
          ),
          RadioListTile(
            title: const Text('Dark'),
            value: ThemeMode.dark,
            groupValue: Theme.of(context).brightness == Brightness.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            onChanged: (ThemeMode? value) {
              if (value != null) {
                onThemeChanged(value);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
