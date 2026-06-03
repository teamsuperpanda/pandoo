import 'package:flutter/material.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/widgets/shared/add_input_bar.dart';

class AddItem extends StatefulWidget {
  const AddItem({
    required this.onItemAdded,
    super.key,
  });

  final Future<void> Function(String) onItemAdded;

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  @override
  Widget build(BuildContext context) {
    return AddInputBar(
      hintText: context.l10n.addNewItem,
      onSubmit: (text) => widget.onItemAdded(text),
    );
  }
}
