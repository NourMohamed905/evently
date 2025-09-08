import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class ButtonItem extends StatelessWidget {
  String text;
  VoidCallback onPressed;
  ButtonItem({super.key, required this.text, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleLarge!.copyWith(color: AppTheme.white),
      ),
    );
  }
}
