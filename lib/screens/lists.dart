import 'package:flutter/material.dart';
import '../widgets/lists/show_lists.dart';
import '../widgets/lists/add_list.dart';

class ListsScreen extends StatelessWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: ShowLists(),
        ),
        AddList(
          onListAdded: () {
            // No need for refresh - ValueListenableBuilder handles updates
          },
        ),
      ],
    );
  }
}
