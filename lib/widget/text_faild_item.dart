import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFaildItem extends StatelessWidget {
  TextInputType keyboardType;
  String hintText;
  TextEditingController? controller;
  String? prefixIcon;
  IconData? SuffixIcon;
  String? Function(String?)? validator;
  TextFaildItem({
    super.key,
    this.controller,
    required this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    this.SuffixIcon,
    this.validator,
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
        validator: validator,
        keyboardType: keyboardType,
      ),
    );
  }
}
