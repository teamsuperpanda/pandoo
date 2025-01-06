import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/detail/add_item.dart';
import '../services/storage_service.dart';
import '../models/list_model.dart';

class DetailScreen extends StatelessWidget {
  final String listTitle;

  const DetailScreen({
    super.key,
    required this.listTitle,
  });

  @override
  Widget build(BuildContext context) {
    final storage = StorageService();

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60,
            color: const Color.fromRGBO(26, 26, 26, 1),
            child: Stack(
              children: [
                // Back button
                Positioned(
                  left: 4,
                  top: 0,
                  bottom: 0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                // Centered text
                Center(
                  child: Text(
                    listTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Cleanup button
                Positioned(
                  right: 4,
                  top: 0,
                  bottom: 0,
                  child: ValueListenableBuilder<Box<ListModel>>(
                    valueListenable: storage.getBoxNotifier(),
                    builder: (context, box, _) {
                      final list = box.get(listTitle);
                      final hasCompletedItems =
                          list?.items.any((item) => item.isCompleted) ?? false;

                      return IconButton(
                        icon: Icon(
                          Icons.cleaning_services_rounded,
                          color: hasCompletedItems
                              ? Colors.white
                              : Colors.white.withAlpha(77),
                        ),
                        onPressed: hasCompletedItems
                            ? () => _showCleanupDialog(context, storage)
                            : null,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TodoList(
              listTitle: listTitle,
              storage: storage,
            ),
          ),
          AddItem(
            onItemAdded: (String text) async {
              await storage.addItemToList(listTitle, text);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showCleanupDialog(
      BuildContext context, StorageService storage) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clean Completed Items'),
        content: const Text('Remove all completed items from this list?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await storage.removeCompletedItems(listTitle);
    }
  }
}

class TodoList extends StatelessWidget {
  final String listTitle;
  final StorageService storage;

  const TodoList({
    super.key,
    required this.listTitle,
    required this.storage,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ListModel>>(
      valueListenable: storage.getBoxNotifier(),
      builder: (context, box, _) {
        final list = box.get(listTitle);
        if (list == null) return const SizedBox();

        // Sort items: unchecked first, then checked
        final sortedItems = [...list.items]..sort((a, b) {
            if (a.isCompleted == b.isCompleted) return 0;
            return a.isCompleted ? 1 : -1;
          });

        return ListView.builder(
          itemCount: sortedItems.length,
          itemBuilder: (context, index) {
            final item = sortedItems[index];
            return TodoItem(
              title: item.text,
              isCompleted: item.isCompleted,
              onToggle: (bool? value) async {
                if (value != null) {
                  await storage.toggleItemCompletion(listTitle, item.id);
                }
              },
            );
          },
        );
      },
    );
  }
}

class TodoItem extends StatelessWidget {
  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onToggle;

  const TodoItem({
    super.key,
    required this.title,
    required this.isCompleted,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: isCompleted,
        onChanged: onToggle,
      ),
      title: Text(
        title,
        style: TextStyle(
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
