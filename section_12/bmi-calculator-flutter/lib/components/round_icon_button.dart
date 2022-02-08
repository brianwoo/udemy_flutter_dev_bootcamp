import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;
  const RoundIconButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Icon(icon),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()),
        backgroundColor: MaterialStateProperty.all(Color(0xFF4C4F5E)),
        minimumSize: MaterialStateProperty.all<Size>(Size(56, 56)),
        elevation: MaterialStateProperty.all<double>(0.0),
      ),
    );
  }
}
