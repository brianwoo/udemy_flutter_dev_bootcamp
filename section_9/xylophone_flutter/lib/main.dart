import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

playSound(String noteFile) async {
  final audioPlayer = AudioCache();
  audioPlayer.play(noteFile);
}

Widget buildKey({required Color color, required String soundFile}) {
  return Expanded(
    child: TextButton(
      style: TextButton.styleFrom(backgroundColor: color),
      child: Text(''),
      onPressed: () {
        playSound(soundFile);
      },
    ),
  );
}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildKey(color: Colors.red, soundFile: 'note1.wav'),
                buildKey(color: Colors.orange, soundFile: 'note2.wav'),
                buildKey(color: Colors.yellow, soundFile: 'note3.wav'),
                buildKey(color: Colors.green, soundFile: 'note4.wav'),
                buildKey(color: Colors.teal, soundFile: 'note5.wav'),
                buildKey(color: Colors.blue, soundFile: 'note6.wav'),
                buildKey(color: Colors.purple, soundFile: 'note7.wav'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
