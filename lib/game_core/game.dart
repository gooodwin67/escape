import 'dart:isolate';

import 'package:escape/game_core/main_loop.dart';
import 'package:escape/utilits/common_vars.dart';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  double x = 150;
  double y = 100;
  late ReceivePort _receivePort;
  late Isolate _isolateLoop;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {});
      x++;
      if (x > 250) {
        x = 150;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      isFirstStartGame = false;
    }
    return Stack(
      children: [
        Positioned(
          left: x,
          top: y,
          child: Text('data'),
        ),
      ],
    );
  }
}
