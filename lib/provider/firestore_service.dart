// import 'package:flutter_catalogue_empatc/model/computer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/monitor.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:uuid/uuid.dart';
import '../model/product.dart';
import '../model/computer.dart';
import '../model/laptop.dart';
import '../model/processor.dart';
import '../model/gpu.dart';

class FirestoreService {
  static Future<void> addProduct(Product product) async {
    await FirebaseFirestore.instance
        .collection('products')
        .add(product.toJson());
  }

  static Future<void> deleteProduct(String id) async {
    await FirebaseFirestore.instance.collection('products').doc(id).delete();
  }

  static Future<void> editProduct(Product product, String id) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .update(product.toJson());
  }

  // Perintah untuk upload image

  // Perintah untuk halaman komputer
  static Future<void> addComputer(Computer computer) async {
    await FirebaseFirestore.instance
        .collection('computers')
        .add(computer.toJson());
  }

  static Future<void> deleteComputer(String id) async {
    await FirebaseFirestore.instance.collection('computers').doc(id).delete();
  }

  static Future<void> editComputer(Computer computer, String id) async {
    await FirebaseFirestore.instance
        .collection('computers')
        .doc(id)
        .update(computer.toJson());
  }

  // Perintah untuk halaman monitor
  static Future<void> addMonitor(Monitor monitor) async {
    await FirebaseFirestore.instance
        .collection('monitors')
        .add(monitor.toJson());
  }

  static Future<void> deleteMonitor(String id) async {
    await FirebaseFirestore.instance.collection('monitors').doc(id).delete();
  }

  static Future<void> editMonitor(Monitor monitor, String id) async {
    await FirebaseFirestore.instance
        .collection('monitors')
        .doc(id)
        .update(monitor.toJson());
  }

  // Perintah untuk halaman monitor
  static Future<void> addLaptop(Laptop laptop) async {
    await FirebaseFirestore.instance.collection('laptops').add(laptop.toJson());
  }

  static Future<void> deleteLaptop(String id) async {
    await FirebaseFirestore.instance.collection('laptops').doc(id).delete();
  }

  static Future<void> editLaptop(Laptop laptop, String id) async {
    await FirebaseFirestore.instance
        .collection('laptops')
        .doc(id)
        .update(laptop.toJson());
  }

  // Perintah untuk halaman monitor
  static Future<void> addProcessor(Processor processor) async {
    await FirebaseFirestore.instance
        .collection('processors')
        .add(processor.toJson());
  }

  static Future<void> deleteProcessor(String id) async {
    await FirebaseFirestore.instance.collection('processors').doc(id).delete();
  }

  static Future<void> editProcessor(Processor processor, String id) async {
    await FirebaseFirestore.instance
        .collection('processors')
        .doc(id)
        .update(processor.toJson());
  }

  // Perintah untuk halaman GPU
  static Future<void> addGpu(Gpu gpu) async {
    await FirebaseFirestore.instance.collection('gpus').add(gpu.toJson());
  }

  static Future<void> deleteGpu(String id) async {
    await FirebaseFirestore.instance.collection('gpus').doc(id).delete();
  }

  static Future<void> editGpu(Gpu gpu, String id) async {
    await FirebaseFirestore.instance
        .collection('gpus')
        .doc(id)
        .update(gpu.toJson());
  }
}
