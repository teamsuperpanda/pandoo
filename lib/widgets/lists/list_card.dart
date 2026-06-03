import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/dialog/delete_list_dialog.dart';
import 'package:pandoo/dialog/list_name_dialog.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    required this.title,
    required this.onTap,
    required this.onDelete,
    required this.onRename,
    required this.index,
    required this.pinned,
    required this.umamiService,
    super.key,
  });

  final String title;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final void Function(String) onRename;
  final int index;
  final bool pinned;
  final UmamiService umamiService;

  Future<bool> _confirmDelete(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => Semantics(
            child: DeleteListDialog(listTitle: title),
          ),
        ) ??
        false;
  }

  Future<String?> _showRenameDialog(BuildContext context) async {
    final result = await showDialog<String>(
      context: context,
      builder: (context) => Semantics(
        child: ListNameDialog(
          title: context.l10n.renameList,
          buttonLabel: context.l10n.rename,
          initialValue: title,
        ),
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dismissible(
      key: ValueKey(title),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) => _confirmDelete(context),
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: theme.colorScheme.error.withAlpha(26),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(
          Icons.delete,
          color: theme.colorScheme.error,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: theme.colorScheme.surface,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (!pinned)
                  Semantics(
                    button: true,
                    label: 'Reorder list',
                    child: ReorderableDragStartListener(
                      index: index,
                      child: Icon(
                        Icons.drag_indicator,
                        color: theme.iconTheme.color?.withAlpha(128),
                      ),
                    ),
                  ),
                if (pinned)
                  Semantics(
                    label: 'Pinned list',
                    child: Icon(
                      Icons.push_pin,
                      color: theme.iconTheme.color?.withAlpha(128),
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Semantics(
                    button: true,
                    label: context.l10n.renameList,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Semantics(
                          header: true,
                          child: GestureDetector(
                            onTap: () {
                              _showRenameDialog(context).then((newName) {
                                if (newName != null && newName != title) {
                                  onRename(newName);
                                }
                              });
                            },
                            child: Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        ValueListenableBuilder<Box<ListModel>>(
                          valueListenable: StorageService().getBoxNotifier(),
                          builder: (context, box, _) {
                            final list = box.get(title);
                            final itemCount = list?.items.length ?? 0;
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                context.l10n.itemsCount(itemCount.toString()),
                                style: TextStyle(
                                  color: theme.colorScheme.onPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Semantics(
                  button: true,
                  label: 'More options',
                  child: PopupMenuButton<String>(
                    icon: Icon(
                      Icons.more_vert,
                      color: theme.iconTheme.color?.withAlpha(128),
                    ),
                    tooltip: 'More options',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'pin',
                        child: Text(
                          pinned ? context.l10n.unpin : context.l10n.pin,
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          context.l10n.delete,
                          style: TextStyle(color: theme.colorScheme.error),
                        ),
                      ),
                    ],
                    onSelected: (value) async {
                      if (value == 'delete') {
                        if (await _confirmDelete(context)) {
                          onDelete();
                        }
                      } else if (value == 'pin') {
                        await StorageService().togglePin(title);
                        umamiService.trackEvent(
                          eventName: pinned
                              ? AnalyticsEvent.listUnpin
                              : AnalyticsEvent.listPin,
                          data: {'list': title},
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
