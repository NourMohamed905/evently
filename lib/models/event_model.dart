import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/models/category_model.dart';

class EventModel {
  String id;
  CategoryModel category;
  String title;
  String description;
  DateTime dateTime;

  EventModel({
    this.id = '',
    required this.title,
    required this.description,
    required this.dateTime,
    required this.category,
  });

  EventModel.fromJson(Map<String, dynamic> json)
    : this(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: CategoryModel.categories.firstWhere(
          (category) => category.id == json['categoryId'],
        ),
        dateTime: (json['timestamp'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'categoryId': category.id,
    'timestamp': Timestamp.fromDate(dateTime),
  };
}
