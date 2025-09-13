import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;
  Color selectedForegroundColor;
  Color unSelectedForegroundColor;
  Color selectedBackgroundColor;

  TabBarItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.selectedBackgroundColor,
    required this.selectedForegroundColor,
    required this.unSelectedForegroundColor,
    t,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(46),
        color: isSelected ? selectedBackgroundColor : Colors.transparent,
        border: isSelected
            ? null
            : Border.all(width: 1, color: unSelectedForegroundColor),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: isSelected
                ? selectedForegroundColor
                : unSelectedForegroundColor,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isSelected
                  ? selectedForegroundColor
                  : unSelectedForegroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
