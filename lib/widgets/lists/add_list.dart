import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../../services/storage_service.dart';
import '../../core/constants/colors.dart';

class AddList extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final StorageService _storage = StorageService();
  final VoidCallback onListAdded;

  AddList({
    super.key,
    required this.onListAdded,
  });

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
                hintText: 'Add new list...',
              ).applyDefaults(theme.inputDecorationTheme),
              style: TextStyle(
                color: theme.brightness == Brightness.dark
                    ? AppColors.pandaWhite
                    : AppColors.pandaBlack,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.dark
                  ? AppColors.bamboo
                  : AppColors.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: const Icon(Icons.add, color: Colors.white),
              onPressed: () async {
                if (_controller.text.isNotEmpty) {
                  final success =
                      await _storage.addList(_controller.text.trim());
                  if (!success) {
                    if (context.mounted) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'List Already Exists',
                          message:
                              '"${_controller.text.trim()}" already exists',
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
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
