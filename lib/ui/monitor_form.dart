// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../provider/firestore_service.dart';
import '../model/monitor.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class MonitorForm extends StatefulWidget {
  const MonitorForm({super.key, this.monitor, this.id});

  final Monitor? monitor;
  final String? id;

  @override
  State<MonitorForm> createState() => _MonitorFormState();
}

class _MonitorFormState extends State<MonitorForm> {
  late TextEditingController nameController;
  late TextEditingController imageUrlController;
  late TextEditingController priceController;
  late TextEditingController deskripsiController;
  // final ImagePicker _picker = ImagePicker();
  // File? _imageFile;
  // ImageProvider? _image;
  // FirebaseStorage storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    imageUrlController = TextEditingController();
    priceController = TextEditingController();
    deskripsiController = TextEditingController();

    if (widget.monitor != null) {
      nameController.text = widget.monitor!.name;
      imageUrlController.text = widget.monitor!.imageUrl;
      priceController.text = widget.monitor!.price;
      deskripsiController.text = widget.monitor!.description;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    imageUrlController.dispose();
    priceController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  // // Fungsi untuk mengunggah gambar ke Firebase Storage
  // Future<void> _uploadImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //     });

  //     final imageUrl = await FirestoreService().uploadImageFile(_imageFile!);
  //     imageUrlController.text = imageUrl;

  //     setState(() {
  //       _image = NetworkImage(imageUrl);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitor Page'),
        actions: [
          IconButton(
              onPressed: () async {
                // Jika file edit
                if (widget.monitor != null) {
                  await FirestoreService.editMonitor(
                      Monitor(
                          name: nameController.text,
                          imageUrl: imageUrlController.text,
                          price: priceController.text,
                          description: deskripsiController.text),
                      widget.id!);
                } else {
                  await FirestoreService.addMonitor(Monitor(
                      name: nameController.text,
                      imageUrl: imageUrlController.text,
                      price: priceController.text,
                      description: deskripsiController.text));
                }

                Navigator.pop(context, {
                  'name': nameController.text,
                  'imageUrl': imageUrlController.text,
                  'price': priceController.text,
                  'description': deskripsiController.text,
                });
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  hintText: "Masukkan Nama Monitor",
                  label: Text('Nama Monitor')),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(
                  hintText: "Masukkan Harga", label: Text('Harga')),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: imageUrlController,
              decoration: const InputDecoration(
                  hintText: "Masukkan Link Gambar", labelText: "Link Gambar"),
            ),

            TextFormField(
              controller: deskripsiController,
              decoration: const InputDecoration(
                  hintText: "Masukkan Deskripsi Produk",
                  label: Text('Deskripsi Produk')),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.network(
              imageUrlController.text.isNotEmpty
                  ? imageUrlController.text
                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
              width: 300,
              height: 250,
              fit: BoxFit.cover,
            ), // Sesuaikan dengan kebutuhan Anda
          ],
        ),
      ),
    );
  }
}
