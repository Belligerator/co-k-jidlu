import 'package:cojekjidlu/theme.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ButtonPrimary(
      {required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: elevatedButtonStyle,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
