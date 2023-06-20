import 'package:cloud_firestore/cloud_firestore.dart';

class Laptop {
  String name;
  String price;
  String imageUrl;
  String description;

  Laptop({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }

  factory Laptop.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Laptop(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
