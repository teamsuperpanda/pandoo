import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final Future<void> Function(String) onItemAdded;

  AddItem({
    super.key,
    required this.onItemAdded,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(8),
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
