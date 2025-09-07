import 'package:flutter/material.dart';

class TextButtonItem extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  TextButtonItem({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(text));
  }
}
