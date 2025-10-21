class UserModel {
  String name;
  String email;
  String id;

  UserModel({required this.id, required this.email, required this.name});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};

  UserModel.fromJson(Map<String, dynamic> json)
    : this(email: json['email'], id: json['id'], name: json['name']);
}
