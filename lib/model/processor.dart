import 'package:cloud_firestore/cloud_firestore.dart';

class Processor {
  String name;
  String price;
  String imageUrl;
  String description;

  Processor({
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

  factory Processor.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Processor(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
