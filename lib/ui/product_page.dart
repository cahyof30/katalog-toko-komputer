// import 'package:empatc/provider/firestore_service.dart';
import 'package:flutter/material.dart';
import '../provider/firestore_service.dart';
import '../model/product.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, this.product, this.id});

  final Product? product;
  final String? id;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // var _nameController = TextEditingController();
  late TextEditingController nameController;
  late TextEditingController deskripsiController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    deskripsiController = TextEditingController();

    if (widget.product != null) {
      nameController.text = widget.product!.name;
      deskripsiController.text = widget.product!.description;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
        actions: [
          IconButton(
              onPressed: () async {
                // Jika file edit
                if (widget.product != null) {
                  await FirestoreService.editProduct(
                      Product(
                          name: nameController.text,
                          description: deskripsiController.text),
                      widget.id!);
                } else {
                  await FirestoreService.addProduct(Product(
                      name: nameController.text,
                      description: deskripsiController.text));
                }

                Navigator.pop(context);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Masukkan Nama Produk", label: Text('Nama Produk')),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: deskripsiController,
              decoration: InputDecoration(
                  hintText: "Masukkan Deskripsi Produk",
                  label: Text('Deskripsi Produk')),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
