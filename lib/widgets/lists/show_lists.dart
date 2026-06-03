import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/screens/detail.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';
import 'package:pandoo/widgets/lists/list_card.dart';

class ShowLists extends StatefulWidget {
  const ShowLists({
    required this.umamiService,
    super.key,
  });

  final UmamiService umamiService;

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
        final pinnedCount = lists.where((list) => list.pinned).length;

        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: lists.length,
          onReorderItem: (oldIndex, newIndex) async {
            if (oldIndex < pinnedCount || newIndex < pinnedCount) return;
            await _storage.reorderLists(oldIndex, newIndex);
          },
          itemBuilder: (context, index) {
            final list = lists[index];
            return ListCard(
              key: ValueKey(list.name),
              title: list.name,
              index: index,
              pinned: list.pinned,
              umamiService: widget.umamiService,
              onTap: () {
                widget.umamiService.trackEvent(
                  eventName: AnalyticsEvent.listOpen,
                  data: {'list': list.name},
                );
                Navigator.push(
                  context,
                  MaterialPageRoute<DetailScreen>(
                    builder: (context) => DetailScreen(
                      listTitle: list.name,
                      umamiService: widget.umamiService,
                    ),
                    settings: RouteSettings(name: '/detail/${list.name}'),
                  ),
                );
              },
              onDelete: () async {
                widget.umamiService.trackEvent(
                  eventName: AnalyticsEvent.listDelete,
                  data: {'list': list.name},
                );
                await _storage.deleteList(list.name);
              },
              onRename: (newName) async {
                final messenger = ScaffoldMessenger.of(context);
                final l10n = context.l10n;
                final success = await _storage.renameList(list.name, newName);
                if (success) {
                  widget.umamiService.trackEvent(
                    eventName: AnalyticsEvent.listRename,
                    data: {'old_name': list.name, 'new_name': newName},
                  );
                } else if (mounted) {
                  messenger.showSnackBar(
                    SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: l10n.listExists,
                        message: l10n.listExistsMessage(newName),
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
