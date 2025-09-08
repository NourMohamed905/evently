import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CategoryModel {
  String id;
  String name;
  String imageName;
  IconData icon;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageName,
    required this.icon,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: '1',
      name: 'Sport',
      imageName: 'sport',
      icon: Icons.sports_basketball,
    ),
    CategoryModel(
      id: '2',
      name: 'Birthday',
      imageName: 'birthday',
      icon: Icons.cake_outlined,
    ),
    CategoryModel(
      id: '3',
      name: 'Meeting',
      imageName: 'meeting',
      icon: Icons.lock_clock_outlined,
    ),
  ];
}
