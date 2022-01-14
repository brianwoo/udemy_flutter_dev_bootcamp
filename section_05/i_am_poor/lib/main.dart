import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "I am Poor",
      home: Scaffold(
        appBar: AppBar(
          title: Text('I am Poor'),
          backgroundColor: Colors.black54,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/poo.png'),
          ),
        ),
        backgroundColor: Colors.grey,
      ),
    ),
  );
}
