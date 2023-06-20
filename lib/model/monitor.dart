import 'package:cloud_firestore/cloud_firestore.dart';

class Monitor {
  String name;
  String price;
  String imageUrl;
  String description;

  Monitor({
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

  factory Monitor.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> json) {
    return Monitor(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }
}
