import 'package:flutter/material.dart';
import 'package:guessnumber2/pages/game_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp /*ชื่่อคลาส*/ (
      title: 'Flutter Demo',/*ชื่่อแอพ*/
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(),
    );
  }
}



