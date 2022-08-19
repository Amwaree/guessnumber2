import 'package:flutter/material.dart';
import 'package:guessnumber2/game.dart';

class GamePage extends StatefulWidget {
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final _controller = TextEditingController();
  final _game = Game();
  var _feedbackText = "";
  var _showTestButton = false;

  void handClickGuess() {
    setState(() {
      _showTestButton = !_showTestButton;
    });

    print("Buttom clicked");
    print(_controller.text); //ค่าที่ผู้ใช้ทายเข้ามา
    var guess = int.parse(_controller.text);
    if (guess == null) {
      print("Input error");
      setState(() {
        _feedbackText = "Input error , please try again";
      });
    } else {
      var result = _game.doGuess(guess);
      if (result == Result.tooHigh) {
        print("Too high");
        setState(() {
          _feedbackText = "Too high , please try again";
        });
      } else if (result == Result.tooLow) {
        print("Too low");
        setState(() {
          _feedbackText = "Too low , please try again";
        });
      } else {
        print("Correct");
        setState(() {
          _feedbackText = "Good job";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Guess the Number")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Please enter number between 1 and 100"),
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter a number',
            ),
          ),
          ElevatedButton(
            onPressed: handClickGuess,
            child:const Text("GUESS"),
          ),
          Text(_feedbackText),


          ElevatedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor:_showTestButton ? Colors.green :Colors.red,
            ),
            onPressed:(){},
            child: Text("TEST"),
          ),
          Icon(_showTestButton ? Icons.print:Icons.access_time_rounded),
        ],
      ),
    );
  }
}
