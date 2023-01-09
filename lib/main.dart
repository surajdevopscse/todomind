import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomind/widgets/todo_mind_app.dart';

import 'models/player_list_changenotifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlayerListChangeNotifier(),
      child: const MaterialApp(
        home: TodoMindApp(),
      ),
    ),
  );
}
