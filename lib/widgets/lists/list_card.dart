import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../services/storage_service.dart';
import '../../models/list_model.dart';

class ListCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final Function(String) onRename;
  final int index;

  const ListCard({
    super.key,
    required this.title,
    required this.onTap,
    required this.onDelete,
    required this.onRename,
    required this.index,
  });

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Delete List'),
            content: Text('Are you sure you want to delete "$title"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text('Delete'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<String?> _showRenameDialog(BuildContext context) async {
    final controller = TextEditingController(text: title);
    final formKey = GlobalKey<FormState>();

    return showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Rename List'),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              labelText: 'List Name',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.pop(context, controller.text.trim());
              }
            },
            child: const Text('Rename'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(title),
      direction: DismissDirection.endToStart, // Only right to left swipe
      confirmDismiss: (_) => _confirmDelete(context),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        color: Colors.red,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: BorderSide(color: Colors.grey.shade200),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 16),
          leading: ReorderableDragStartListener(
            index: index,
            child: const Icon(
              Icons.drag_indicator,
              color: Colors.grey,
            ),
          ),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ValueListenableBuilder<Box<ListModel>>(
                  valueListenable: StorageService().getBoxNotifier(),
                  builder: (context, box, _) {
                    final list = box.get(title);
                    final itemCount = list?.items.length ?? 0;
                    return Text(
                      '$itemCount',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 8),
              Text(title),
            ],
          ),
          trailing: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 'rename',
                  child: const Text('Rename'),
                ),
                const PopupMenuDivider(),
                PopupMenuItem(
                  value: 'delete',
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
              onSelected: (value) async {
                if (value == 'delete') {
                  if (await _confirmDelete(context)) {
                    onDelete();
                  }
                } else if (value == 'rename') {
                  final newName = await _showRenameDialog(context);
                  if (newName != null && newName != title) {
                    onRename(newName);
                  }
                }
              },
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
