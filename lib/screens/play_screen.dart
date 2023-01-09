import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Congrats!",
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              "You Played Well Done!",
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Back",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
