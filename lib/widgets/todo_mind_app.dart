import 'package:flutter/material.dart';
import 'package:todomind/screens/add_new_player_screen.dart';
import 'package:todomind/widgets/player_list_with_listview.dart';

class TodoMindApp extends StatelessWidget {
  const TodoMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Mind App'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: const PlayerListWithListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewPlayer(),
            ),
          );
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
