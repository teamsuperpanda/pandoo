import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';

class RenameListDialog extends StatefulWidget {
  const RenameListDialog({
    required this.currentName,
    super.key,
  });

  final String currentName;

  @override
  State<RenameListDialog> createState() => _RenameListDialogState();
}

class _RenameListDialogState extends State<RenameListDialog> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.currentName);
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.pop(context, _controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Semantics(
        header: true,
        child: Text(context.l10n.renameList),
      ),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return context.l10n.nameCannotBeEmpty;
            }
            return null;
          },
          onEditingComplete: _submit,
          decoration: InputDecoration(
            labelText: context.l10n.listName,
          ).applyDefaults(Theme.of(context).inputDecorationTheme),
        ),
      ),
      actions: [
        Semantics(
          button: true,
          label: context.l10n.cancel,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(context.l10n.cancel),
          ),
        ),
        Semantics(
          button: true,
          label: context.l10n.rename,
          child: FilledButton(
            onPressed: _submit,
            child: Text(context.l10n.rename),
          ),
        ),
      ],
      actionsPadding: const EdgeInsets.all(16),
    );
  }
}
