import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarIcons extends StatelessWidget {
  String iconName;
  NavBarIcons({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
    );
  }
}
