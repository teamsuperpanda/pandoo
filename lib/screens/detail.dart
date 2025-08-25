import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../widgets/detail/add_item.dart';
import '../services/storage_service.dart';
import '../models/list_model.dart';
import '../dialog/cleanup_dialog.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:pandoo/l10n/app_localizations.dart';

class DetailScreen extends StatefulWidget {
  final String listTitle;

  const DetailScreen({
    super.key,
    required this.listTitle,
  });

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        elevation: Theme.of(context).appBarTheme.elevation,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        title: GestureDetector(
          onTap: () => _showRenameDialog(context),
          child: Text(
            _currentListTitle,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          ValueListenableBuilder<Box<ListModel>>(
            valueListenable: _storage.getBoxNotifier(),
            builder: (context, box, _) {
              final list = box.get(_currentListTitle);
              final hasCompletedItems =
                  list?.items.any((item) => item.isCompleted) ?? false;

              return IconButton(
                icon: Icon(
                  Icons.cleaning_services_rounded,
                  color: hasCompletedItems
                      ? Theme.of(context).appBarTheme.foregroundColor
                      : Theme.of(context).appBarTheme.foregroundColor?.withAlpha((255 * 0.38).round()),
                ),
                onPressed: hasCompletedItems
                    ? () => _showCleanupDialog(context, _storage)
                    : null,
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
                child: TodoList(
                  listTitle: _currentListTitle,
                  storage: _storage,
                ),
              ),
            ),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: AddItem(
                onItemAdded: (String text) async {
                  await _storage.addItemToList(_currentListTitle, text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showCleanupDialog(
      BuildContext context, StorageService storage) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => const CleanupDialog(),
    );

    if (confirmed == true) {
      await storage.removeCompletedItems(_currentListTitle);
    }
  }

  Future<void> _showRenameDialog(BuildContext context) async {
    final controller = TextEditingController(text: _currentListTitle);
    final formKey = GlobalKey<FormState>();

    final newName = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Theme.of(context).colorScheme.surface
            : Theme.of(context).colorScheme.surface,
        elevation: 4, // Added a small elevation for better visual separation
        title: Text(
          AppLocalizations.of(context)!.renameList,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
        ),
        content: Form(
          key: formKey,
          child: TextFormField(
            controller: controller,
            autofocus: true,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Name cannot be empty';
              }
              return null;
            },
            onEditingComplete: () {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.pop(context, controller.text.trim());
              }
            },
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
            ),
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.listName,
            ).applyDefaults(Theme.of(context).inputDecorationTheme),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                Navigator.pop(context, controller.text.trim());
              }
            },
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Text(AppLocalizations.of(context)!.rename),
          ),
        ],
        actionsPadding: const EdgeInsets.all(16),
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
                title: AppLocalizations.of(context)!.listExists,
                message:
                    AppLocalizations.of(context)!.listExistsMessage(newName),
                contentType: ContentType.failure,
              ),
            ),
          );
        }
      } else {
        setState(() {
          _currentListTitle = newName;
        });
      }
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
    final theme = Theme.of(context);
    return ListTile(
      leading: Checkbox(
        fillColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.selected)) {
            return theme.brightness == Brightness.light
                ? Colors.black
                : Colors.white;
          }
          return Colors.grey;
        }),
        checkColor:
            theme.brightness == Brightness.light ? Colors.white : Colors.black,
        value: isCompleted,
        onChanged: onToggle,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: theme.brightness == Brightness.light
              ? Colors.black
              : Colors.white,
          decoration: isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
    );
  }
}
