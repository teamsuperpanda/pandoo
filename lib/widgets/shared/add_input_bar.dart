import 'package:flutter/material.dart';
import 'package:pandoo/core/theme/app_spacing.dart';

class AddInputBar extends StatefulWidget {
  const AddInputBar({
    required this.hintText,
    required this.onSubmit,
    super.key,
  });

  final String hintText;
  final Future<void> Function(String text) onSubmit;

  @override
  State<AddInputBar> createState() => _AddInputBarState();
}

class _AddInputBarState extends State<AddInputBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit({bool clearFocus = false}) async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    await widget.onSubmit(text);
    if (!mounted) return;
    _controller.clear();
    if (clearFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(AppSpacing.gapMd),
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
                hintText: widget.hintText,
              ),
              onSubmitted: (_) => _handleSubmit(clearFocus: true),
            ),
          ),
          const SizedBox(width: AppSpacing.gapSm),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
            ),
            child: IconButton(
              icon: const Icon(Icons.add),
              tooltip: widget.hintText,
              onPressed: _handleSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
