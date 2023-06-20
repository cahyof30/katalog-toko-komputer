// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import '../provider/firestore_service.dart';
import '../model/computer.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class ComputerForm extends StatefulWidget {
  const ComputerForm({super.key, this.computer, this.id});

  final Computer? computer;
  final String? id;

  @override
  State<ComputerForm> createState() => _ComputerFormState();
}

class _ComputerFormState extends State<ComputerForm> {
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

    if (widget.computer != null) {
      nameController.text = widget.computer!.name;
      imageUrlController.text = widget.computer!.imageUrl;
      priceController.text = widget.computer!.price;
      deskripsiController.text = widget.computer!.description;
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
        title: const Text('Computer Page'),
        actions: [
          IconButton(
              onPressed: () async {
                // Jika file edit
                if (widget.computer != null) {
                  await FirestoreService.editComputer(
                      Computer(
                          name: nameController.text,
                          imageUrl: imageUrlController.text,
                          price: priceController.text,
                          description: deskripsiController.text),
                      widget.id!);
                } else {
                  await FirestoreService.addComputer(Computer(
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
                  hintText: "Masukkan Nama Produk", label: Text('Nama Produk')),
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
            // ElevatedButton(
            //   onPressed: _uploadImage,
            //   child: const Text("Unggah Gambar"),
            // ),
            // const SizedBox(height: 10),
            // _image != null
            //     ? Image(image: _image!)
            //     : Container(), // Tampilkan gambar jika ada, jika tidak, tampilkan kontainer kosong
            // const SizedBox(height: 10),
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

// // import 'package:empatc/provider/firestore_service.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:empatc/provider/firestore_service.dart' show FirestoreService;
// import '../model/computer.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class ComputerPage extends StatefulWidget {
//   const ComputerPage({super.key, this.computer, this.id});

//   final Computer? computer;
//   final String? id;

//   @override
//   State<ComputerPage> createState() => _ComputerPageState();
// }

// class _ComputerPageState extends State<ComputerPage> {
//   late TextEditingController nameController;
//   late TextEditingController imageUrlController;
//   late TextEditingController priceController;
//   late TextEditingController deskripsiController;

//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController();
//     imageUrlController = TextEditingController();
//     priceController = TextEditingController();
//     deskripsiController = TextEditingController();

//     if (widget.computer != null) {
//       nameController.text = widget.computer!.name;
//       imageUrlController.text = widget.computer!.imageUrl;
//       priceController.text = widget.computer!.price;
//       deskripsiController.text = widget.computer!.description;
//     }
//   }

//   @override
//   void dispose() {
//     nameController.dispose();
//     imageUrlController.dispose();
//     priceController.dispose();
//     deskripsiController.dispose();
//     super.dispose();
//   }

//   // Fungsi untuk mengunggah gambar ke Firebase Storage

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Computer Page'),
//         actions: [
//           IconButton(
//               onPressed: () async {
//                 // Jika file edit
//                 if (widget.computer != null) {
//                   await FirestoreService.editComputer(
//                       Computer(
//                           name: nameController.text,
//                           imageUrl: imageUrlController.text,
//                           price: priceController.text,
//                           description: deskripsiController.text),
//                       widget.id!);
//                 } else {
//                   await FirestoreService.addComputer(Computer(
//                       name: nameController.text,
//                       imageUrl: imageUrlController.text,
//                       price: priceController.text,
//                       description: deskripsiController.text));
//                 }

//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.check))
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: nameController,
//               decoration: const InputDecoration(
//                   hintText: "Masukkan Nama Produk", label: Text('Nama Produk')),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: priceController,
//               decoration: const InputDecoration(
//                   hintText: "Masukkan Harga", label: Text('Harga')),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextFormField(
//               controller: imageUrlController,
//               decoration: const InputDecoration(
//                   hintText: "Masukkan Gambar", labelText: "Gambar"),
//             ),
//             const SizedBox(height: 10),
//             TextFormField(
//               controller: deskripsiController,
//               decoration: const InputDecoration(
//                   hintText: "Masukkan Deskripsi Produk",
//                   label: Text('Deskripsi Produk')),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
