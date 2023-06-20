import 'package:cloud_firestore/cloud_firestore.dart';

class Computer {
  String name;
  String price;
  String imageUrl;
  String description;

  Computer({
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

  factory Computer.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Computer(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
