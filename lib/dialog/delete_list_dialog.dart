import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';

class DeleteListDialog extends StatelessWidget {
  const DeleteListDialog({
    required this.listTitle,
    super.key,
  });

  final String listTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Semantics(
        header: true,
        child: Text(context.l10n.deleteList),
      ),
      content: Text(
        context.l10n.deleteConfirmation(listTitle),
        style: Theme.of(context).textTheme.bodyLarge,
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
          label: context.l10n.delete,
          child: FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(context.l10n.delete),
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
    );
  }
}
