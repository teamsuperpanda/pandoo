import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';

class CleanupDialog extends StatelessWidget {
  const CleanupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Semantics(
        header: true,
        child: Text(context.l10n.cleanCompleted),
      ),
      content: Semantics(
        child: Text(
          context.l10n.cleanConfirmation,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      actions: [
        Semantics(
          button: true,
          label: context.l10n.cancel,
          child: TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(context.l10n.cancel),
          ),
        ),
        Semantics(
          button: true,
          label: context.l10n.clean,
          child: FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(context.l10n.clean),
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
    );
  }
}
