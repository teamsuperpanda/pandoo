import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

class CleanupDialog extends StatelessWidget {
  const CleanupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: theme.brightness == Brightness.light
          ? Colors.white
          : const Color(0xFF1E1E1E),
      title: Text(
        context.l10n.cleanCompleted,
        style: TextStyle(
          color: theme.brightness == Brightness.light
              ? Colors.black
              : Colors.white,
        ),
      ),
      content: Text(
        context.l10n.cleanConfirmation,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(context.l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          child: Text(context.l10n.clean),
        ),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
    );
  }
}
