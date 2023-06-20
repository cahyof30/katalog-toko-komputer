import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String name;
  String description;

  Product({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  factory Product.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Product(name: json['name'], description: json['description']);
  }
}
