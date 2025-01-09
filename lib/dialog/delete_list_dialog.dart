import 'package:flutter/material.dart';
import '../l10n/l10n.dart';

class DeleteListDialog extends StatelessWidget {
  final String listTitle;

  const DeleteListDialog({
    super.key,
    required this.listTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(context.l10n.deleteList),
      content: Text(
        context.l10n.deleteConfirmation(listTitle),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(context.l10n.cancel),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, true),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.error,
            foregroundColor: Theme.of(context).colorScheme.onError,
          ),
          child: Text(context.l10n.delete),
        ),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
    );
  }
}
