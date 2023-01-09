import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomind/models/player_list_changenotifier.dart';
import 'package:todomind/screens/play_screen.dart';
import 'package:todomind/widgets/player_count.dart';

class PlayerListWithListView extends StatefulWidget {
  const PlayerListWithListView({super.key});

  @override
  _PlayerListWithListViewState createState() => _PlayerListWithListViewState();
}

class _PlayerListWithListViewState extends State<PlayerListWithListView> {
  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<PlayerListChangeNotifier>(
      context,
      listen: false,
    );
    return Consumer<PlayerListChangeNotifier>(
      builder: (_, playerListCNInstance, __) => playerListCNInstance
              .listOfPlayerName.isNotEmpty
          ? ListView(
              children: <Widget>[
                ...playerListCNInstance.listOfPlayerName.map(
                  (player) => GestureDetector(
                    onHorizontalDragEnd: (_) {
                      playerListCNInstance.deleteAPlayer(
                        player,
                      );
                    },
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        title: Text(
                          '${player.name}',
                          style: const TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                        trailing: InkWell(
                          child: Icon(
                            Icons.delete,
                            color: Colors.red[500],
                          ),
                          onTap: () {
                            playerListCNInstance.deleteAPlayer(player);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(80.0),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
                  child: ElevatedButton(
                    onPressed: () {
                      int playerLength = pro.getAllPlayer();
                      if (playerLength < 2) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Player Added Alert"),
                            content: const Text(
                                "You Need to Add Minimum two Player for Play"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(14),
                                  child: const Text(
                                    "Okay",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PlayScreen(),
                          ),
                        );
                      }
                    },
                    child: const Text('LET\'S PLAY'),
                  ),
                ),
                const PlayerCount()
              ],
            )
          : const Center(
              child: Text(
                "There is No any Player Added \n Click on + Button to add Player",
                style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
