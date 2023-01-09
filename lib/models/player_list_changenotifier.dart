import 'package:flutter/cupertino.dart';
import 'package:todomind/models/player_model.dart';

class PlayerListChangeNotifier extends ChangeNotifier {
  final List<PlayerModel> listOfPlayerName = [];

  void deleteAPlayer(PlayerModel player) {
    listOfPlayerName.removeWhere((thePlayer) => player.id == thePlayer.id);
    notifyListeners();
  }

  void addNewPlayerToList(PlayerModel newPlayer) {
    listOfPlayerName.add(newPlayer);
    notifyListeners();
  }

  int getAllPlayer() {
    return listOfPlayerName.length;
  }
}
