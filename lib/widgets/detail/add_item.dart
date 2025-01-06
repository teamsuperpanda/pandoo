import 'package:flutter/material.dart';
import '../../core/constants/colors.dart';

class AddItem extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Future<void> Function(String) onItemAdded;

  AddItem({
    super.key,
    required this.onItemAdded,
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
                hintText: 'Add new item...',
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
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  onItemAdded(_controller.text);
                  _controller.clear();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
