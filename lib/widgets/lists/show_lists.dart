import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/list_model.dart';
import '../../services/storage_service.dart';
import 'list_card.dart';
import '../../screens/detail.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ShowLists extends StatefulWidget {
  const ShowLists({super.key});

  @override
  State<ShowLists> createState() => ShowListsState();
}

class ShowListsState extends State<ShowLists> {
  final StorageService _storage = StorageService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ListModel>>(
      valueListenable: _storage.getBoxNotifier(),
      builder: (context, box, _) {
        final lists = _storage.getAllLists();

        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: lists.length,
          onReorder: (oldIndex, newIndex) async {
            await _storage.reorderLists(oldIndex, newIndex);
          },
          itemBuilder: (context, index) {
            final list = lists[index];
            return ListCard(
              key: ValueKey(list.name),
              title: list.name,
              index: index,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      listTitle: list.name,
                    ),
                  ),
                );
              },
              onDelete: () async {
                await _storage.deleteList(list.name);
              },
              onRename: (newName) async {
                final success = await _storage.renameList(list.name, newName);
                if (!success && context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'List Already Exists',
                        message: '"$newName" already exists',
                        contentType: ContentType.failure,
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
