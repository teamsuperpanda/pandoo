import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/dialog/clean_dialog.dart';
import 'package:pandoo/dialog/list_name_dialog.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/services/umami_service.dart';
import 'package:pandoo/widgets/detail/add_item.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.listTitle,
    required this.umamiService,
    super.key,
  });

  final String listTitle;
  final UmamiService umamiService;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String _currentListTitle;
  final StorageService _storage = StorageService();

  @override
  void initState() {
    super.initState();
    _currentListTitle = widget.listTitle;
    widget.umamiService.trackPageView(
      url: '/detail/${widget.listTitle}',
      title: widget.listTitle,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
        elevation: theme.appBarTheme.elevation,
        centerTitle: theme.appBarTheme.centerTitle,
        title: Semantics(
          button: true,
          label: '${context.l10n.renameList}: $_currentListTitle',
          child: GestureDetector(
            onTap: () => _showRenameDialog(context),
            child: Text(
              _currentListTitle,
              style: theme.appBarTheme.titleTextStyle,
            ),
          ),
        ),
        leading: Semantics(
          button: true,
          label: MaterialLocalizations.of(context).backButtonTooltip,
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: theme.appBarTheme.foregroundColor,
            ),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          ValueListenableBuilder<Box<ListModel>>(
            valueListenable: _storage.getBoxNotifier(),
            builder: (context, box, _) {
              final list = box.get(_currentListTitle);
              final hasCompletedItems =
                  list?.items.any((item) => item.isCompleted) ?? false;

              return Semantics(
                button: true,
                label: context.l10n.cleanCompleted,
                child: IconButton(
                  icon: Icon(
                    Icons.cleaning_services_rounded,
                    color: hasCompletedItems
                        ? theme.appBarTheme.foregroundColor
                        : theme.appBarTheme.foregroundColor?.withAlpha(
                            (255 * 0.38).round(),
                          ),
                  ),
                  tooltip: context.l10n.cleanCompleted,
                  onPressed: hasCompletedItems
                      ? () => _showCleanDialog(context, _storage)
                      : null,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: _TodoListView(
                  listTitle: _currentListTitle,
                  storage: _storage,
                  umamiService: widget.umamiService,
                ),
              ),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: AddItem(
                onItemAdded: (String text) async {
                  await _storage.addItemToList(_currentListTitle, text);
                  widget.umamiService.trackEvent(
                    eventName: AnalyticsEvent.itemAdd,
                    data: {'list': _currentListTitle},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCleanDialog(
    BuildContext context,
    StorageService storage,
  ) async {
    widget.umamiService.trackEvent(
      eventName: AnalyticsEvent.cleanupDialog,
      data: {'list': _currentListTitle},
    );
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => Semantics(
        child: const CleanDialog(),
      ),
    );

    if (confirmed ?? false) {
      await storage.removeCompletedItems(_currentListTitle);
      widget.umamiService.trackEvent(
        eventName: AnalyticsEvent.cleanupComplete,
        data: {'list': _currentListTitle},
      );
    }
  }

  Future<void> _showRenameDialog(BuildContext context) async {
    final newName = await showDialog<String>(
      context: context,
      builder: (ctx) => Semantics(
        child: ListNameDialog(
          title: ctx.l10n.renameList,
          buttonLabel: ctx.l10n.rename,
          initialValue: _currentListTitle,
        ),
      ),
    );

    if (newName != null && newName != _currentListTitle && context.mounted) {
      final success = await _storage.renameList(_currentListTitle, newName);
      if (!success) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              content: AwesomeSnackbarContent(
                title: context.l10n.listExists,
                message: context.l10n.listExistsMessage(newName),
                contentType: ContentType.failure,
              ),
            ),
          );
        }
      } else {
        widget.umamiService.trackEvent(
          eventName: AnalyticsEvent.listRename,
          data: {'old_name': _currentListTitle, 'new_name': newName},
        );
        setState(() {
          _currentListTitle = newName;
        });
      }
    }
  }
}

class _TodoListView extends StatelessWidget {
  const _TodoListView({
    required this.listTitle,
    required this.storage,
    required this.umamiService,
  });

  final String listTitle;
  final StorageService storage;
  final UmamiService umamiService;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ListModel>>(
      valueListenable: storage.getBoxNotifier(),
      builder: (context, box, _) {
        final list = box.get(listTitle);
        if (list == null) return const SizedBox();

        // Sort items: unchecked first, then checked
        final sortedItems = [...list.items]
          ..sort((a, b) {
            if (a.isCompleted == b.isCompleted) return 0;
            return a.isCompleted ? 1 : -1;
          });

        return ListView.builder(
          itemCount: sortedItems.length,
          itemBuilder: (context, index) {
            final item = sortedItems[index];
            return _TodoItemTile(
              title: item.text,
              isCompleted: item.isCompleted,
              onToggle: (bool? value) async {
                if (value != null) {
                  await storage.toggleItemCompletion(listTitle, item.id);
                  umamiService.trackEvent(
                    eventName: AnalyticsEvent.itemToggle,
                    data: {
                      'list': listTitle,
                      'completed': (!item.isCompleted).toString(),
                    },
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

class _TodoItemTile extends StatelessWidget {
  const _TodoItemTile({
    required this.title,
    required this.isCompleted,
    required this.onToggle,
  });

  final String title;
  final bool isCompleted;
  final ValueChanged<bool?> onToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      // TODO(M26): use localized strings for 'Completed' / 'Incomplete'
      label: '${isCompleted ? 'Completed' : 'Incomplete'}: $title',
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: onToggle,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: theme.colorScheme.onSurface,
            decoration: isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
