import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../services/storage_service.dart';
import '../../l10n/l10n.dart';

class AddList extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final StorageService _storage = StorageService();
  final VoidCallback onListAdded;

  AddList({
    super.key,
    required this.onListAdded,
  });

  Future<void> _handleSubmit(BuildContext context,
      {bool keepFocus = false}) async {
    if (_controller.text.isNotEmpty) {
      final success = await _storage.addList(_controller.text.trim());
      if (!success) {
        if (context.mounted) {
          final snackBar = SnackBar(
            elevation: 0,
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: context.l10n.listExists,
              message: context.l10n.listExistsMessage(_controller.text.trim()),
              contentType: ContentType.failure,
            ),
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        return;
      }
      _controller.clear();
      onListAdded();
      if (keepFocus && context.mounted) {
        FocusScope.of(context).requestFocus(FocusNode());
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(13),
            offset: const Offset(0, -4),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: context.l10n.addNewList,
              ).applyDefaults(theme.inputDecorationTheme),
              style: TextStyle(
                color: theme.colorScheme.onSurface,
              ),
              onSubmitted: (_) => _handleSubmit(context, keepFocus: true),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(Icons.add, color: theme.colorScheme.onPrimary),
              onPressed: () => _handleSubmit(context),
            ),
          ),
        ],
      ),
    );
  }
}
