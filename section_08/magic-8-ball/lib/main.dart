import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blue.shade800,
          ),
          body: BallPage(),
        ),
      ),
    );

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;

  void handleButtonPressed() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
      print('ballNum: ' + ballNumber.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: TextButton(
          child: Image.asset(
            'images/ball${ballNumber}.png',
          ),
          onPressed: handleButtonPressed,
        ),
      ),
    );
  }
}
