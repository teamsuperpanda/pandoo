import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pandoo/dialog/clean_dialog.dart';
import 'package:pandoo/dialog/list_name_dialog.dart';
import 'package:pandoo/l10n/l10n.dart';
import 'package:pandoo/models/list_model.dart';
import 'package:pandoo/services/storage_service.dart';
import 'package:pandoo/widgets/shared/add_input_bar.dart';
import 'package:pandoo/widgets/shared/app_snackbar.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    required this.listTitle,
    super.key,
  });

  final String listTitle;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late String _currentListTitle;
  final StorageService _storage = StorageService();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _currentListTitle = widget.listTitle;
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: TextField(
                key: const Key('searchField'),
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: context.l10n.searchItems,
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: _searchController.clear,
                        )
                      : null,
                ),
              ),
            ),
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
                  searchQuery: _searchQuery,
                ),
              ),
            ),
            ColoredBox(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: AddInputBar(
                hintText: context.l10n.addNewItem,
                onSubmit: (text) =>
                    _storage.addItemToList(_currentListTitle, text),
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
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const CleanDialog(),
    );

    if (!mounted) return;
    if (confirmed ?? false) {
      await storage.removeCompletedItems(_currentListTitle);
    }
  }

  Future<void> _showRenameDialog(BuildContext context) async {
    final newName = await showDialog<String>(
      context: context,
      builder: (ctx) => ListNameDialog(
        title: ctx.l10n.renameList,
        buttonLabel: ctx.l10n.rename,
        initialValue: _currentListTitle,
      ),
    );

    if (newName != null && newName != _currentListTitle && context.mounted) {
      final success = await _storage.renameList(_currentListTitle, newName);
      if (!context.mounted) return;
      if (!success) {
        showErrorSnackBar(
          context,
          title: context.l10n.listExists,
          message: context.l10n.listExistsMessage(newName),
        );
      } else {
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
    required this.searchQuery,
  });

  final String listTitle;
  final StorageService storage;
  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box<ListModel>>(
      valueListenable: storage.getBoxNotifier(),
      builder: (context, box, _) {
        final list = box.get(listTitle);
        if (list == null) return const SizedBox();

        var sortedItems = [
          ...list.items.where((item) => !item.isCompleted),
          ...list.items.where((item) => item.isCompleted),
        ];

        if (searchQuery.isNotEmpty) {
          final query = searchQuery.trim().toLowerCase();
          sortedItems = sortedItems
              .where((item) => item.text.toLowerCase().contains(query))
              .toList();
        }

        return ListView.builder(
          itemCount: sortedItems.length,
          itemBuilder: (context, index) {
            final item = sortedItems[index];
            return _TodoItemTile(
              title: item.text,
              isCompleted: item.isCompleted,
              itemId: item.id,
              listTitle: listTitle,
              storage: storage,
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

class _TodoItemTile extends StatelessWidget {
  const _TodoItemTile({
    required this.title,
    required this.isCompleted,
    required this.itemId,
    required this.listTitle,
    required this.storage,
    required this.onToggle,
  });

  final String title;
  final bool isCompleted;
  final String itemId;
  final String listTitle;
  final StorageService storage;
  final ValueChanged<bool?> onToggle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dismissible(
      key: ValueKey(itemId),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: theme.colorScheme.error.withAlpha(26),
        ),
        child: Icon(
          Icons.delete,
          color: theme.colorScheme.error,
        ),
      ),
      onDismissed: (_) {
        unawaited(storage.deleteItemFromList(listTitle, itemId));
      },
      child: Semantics(
        button: true,
        label: isCompleted
            ? context.l10n.completedItemLabel(title)
            : context.l10n.incompleteItemLabel(title),
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
      ),
    );
  }
}
