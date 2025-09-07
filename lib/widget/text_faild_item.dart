import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFaildItem extends StatelessWidget {
  TextInputType keyboardType;
  String hintText;
  TextEditingController controller;
  String? prefixIcon;
  IconData? SuffixIcon;
  TextFaildItem({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    this.SuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          hintText: hintText,
          prefixIcon: prefixIcon == null
              ? null
              : SvgPicture.asset(
                  'assets/icons/$prefixIcon.svg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
          suffixIcon: SuffixIcon == null ? null : Icon(SuffixIcon, size: 24),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        onSaved: (value) {
          // Save the value to a variable or perform any action
        },
        keyboardType: keyboardType,
      ),
    );
  }
}
