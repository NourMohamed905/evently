import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextFaildItem extends StatefulWidget {
  TextInputType keyboardType;
  String hintText;
  TextEditingController? controller;
  String? prefixIcon;
  String? Function(String?)? validator;
  bool isPassword;
  TextFaildItem({
    super.key,
    this.controller,
    required this.hintText,
    required this.keyboardType,
    this.prefixIcon,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<TextFaildItem> createState() => _TextFaildItemState();
}

class _TextFaildItemState extends State<TextFaildItem> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon == null
              ? null
              : SvgPicture.asset(
                  'assets/icons/${widget.prefixIcon}.svg',
                  width: 24,
                  height: 24,
                  fit: BoxFit.scaleDown,
                ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  icon: isObscure
                      ? Icon(
                          Icons.visibility_off_outlined,
                          color: AppTheme.grey,
                        )
                      : Icon(Icons.visibility_outlined, color: AppTheme.grey),
                )
              : null,
        ),
        validator: widget.validator,
        obscureText: isObscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
