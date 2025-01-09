import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

class CleanupDialog extends StatelessWidget {
  const CleanupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.cleanCompleted),
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
