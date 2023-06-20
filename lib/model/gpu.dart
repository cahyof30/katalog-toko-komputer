import 'package:cloud_firestore/cloud_firestore.dart';

class Gpu {
  String name;
  String price;
  String imageUrl;
  String description;

  Gpu({
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

  factory Gpu.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Gpu(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
