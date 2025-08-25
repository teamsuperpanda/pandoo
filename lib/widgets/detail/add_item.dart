import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';

class AddItem extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Future<void> Function(String) onItemAdded;

  AddItem({
    super.key,
    required this.onItemAdded,
  });

  Future<void> _handleSubmit(BuildContext context,
      {bool keepFocus = false}) async {
    if (_controller.text.isNotEmpty) {
      await onItemAdded(_controller.text);
      _controller.clear();
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
                hintText: context.l10n.addNewItem,
                hintStyle: TextStyle(
                  color: (theme.brightness == Brightness.light
                          ? Colors.black
                          : Colors.white)
                      .withAlpha(128),
                ),
                fillColor: theme.brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ).applyDefaults(theme.inputDecorationTheme),
              style: TextStyle(
                color: theme.brightness == Brightness.light
                    ? Colors.black
                    : Colors.white,
              ),
              onSubmitted: (_) => _handleSubmit(context, keepFocus: true),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: theme.brightness == Brightness.light
                  ? Colors.black
                  : Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              icon: Icon(
                Icons.add,
                color: theme.brightness == Brightness.light
                    ? Colors.white
                    : Colors.black,
              ),
              onPressed: () => _handleSubmit(context),
            ),
          ),
        ],
      ),
    );
  }
}
