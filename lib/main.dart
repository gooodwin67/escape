import 'package:escape/game_core/game.dart';
import 'package:escape/game_core/main_loop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: overlays)

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: Game()));
}
