import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            // verticalDirection: VerticalDirection.up,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100.0,
                color: Colors.deepOrange,
                child: Text('Container 1'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.amber,
                    width: 100.0,
                    height: 100.0,
                  ),
                  Container(
                    color: Colors.green,
                    width: 100.0,
                    height: 100.0,
                  ),
                ],
              ),
              Container(
                width: 100.00,
                color: Colors.blue,
                child: Text('Container 3'),
              ),
              // Container(
              //   width: double.infinity,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
