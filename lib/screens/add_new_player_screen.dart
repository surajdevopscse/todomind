import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todomind/models/player_list_changenotifier.dart';
import 'package:todomind/models/player_model.dart';

class AddNewPlayer extends StatefulWidget {
  const AddNewPlayer({super.key});

  @override
  _AddNewPlayerState createState() => _AddNewPlayerState();
}

class _AddNewPlayerState extends State<AddNewPlayer> {
  String? _txtName;
  String? _txtId;
  PlayerModel _newPlayer = PlayerModel();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Widget _buildPlayerId() {
    return TextFormField(
      keyboardType: TextInputType.number,
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Player Id Required !";
        }
        return null;
      },
      decoration: const InputDecoration(labelText: 'Player Id:'),
      onSaved: (String? value) {
        _txtId = value;
      },
    );
  }

  Widget _buildPlayerName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Player Name:'),
      validator: (String? value) {
        if (value?.isEmpty == true) {
          return "Player Name Required !";
        }
        return null;
      },
      onSaved: (String? value) {
        _txtName = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Player'), // a bad practise Text('$title')
        centerTitle: true,
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                _buildPlayerId(),
                _buildPlayerName(),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState?.save();
                    }
                    _newPlayer =
                        PlayerModel(id: int.parse('$_txtId'), name: _txtName);
                    Provider.of<PlayerListChangeNotifier>(
                      context,
                      listen: false,
                    ).addNewPlayerToList(_newPlayer);
                    Navigator.pop(context);
                  },
                  child: const Text('Add +'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
