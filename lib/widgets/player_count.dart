import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomind/models/player_list_changenotifier.dart';

class PlayerCount extends StatelessWidget {
  const PlayerCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerListChangeNotifier>(
      builder: (ctx, playerListCNInstance, widget) => Container(
        margin: const EdgeInsets.all(20.0),
        child: Text(
          'Total Added Player : ${playerListCNInstance.listOfPlayerName.length}',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        ),
      ),
    );
  }
}
