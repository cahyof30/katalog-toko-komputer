import '../model/laptop.dart';
import 'laptop_form.dart';
import 'package:flutter/material.dart';

class LaptopDetail extends StatefulWidget {
  final Laptop laptop;
  final String id;

  const LaptopDetail({required this.laptop, required this.id});

  @override
  _LaptopDetailState createState() => _LaptopDetailState();
}

class _LaptopDetailState extends State<LaptopDetail> {
  late Laptop _updatedLaptop;

  @override
  void initState() {
    super.initState();
    _updatedLaptop = widget.laptop;
  }

  Future<void> _editLaptop() async {
    var updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LaptopForm(
          laptop: _updatedLaptop,
          id: widget.id,
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        // Perbarui tampilan dengan data yang diterima
        _updatedLaptop = Laptop(
          name: updatedData['name'],
          imageUrl: updatedData['imageUrl'],
          price: updatedData['price'],
          description: updatedData['description'],
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.laptop.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _updatedLaptop.imageUrl.isNotEmpty
                  ? _updatedLaptop.imageUrl
                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Produk: ${_updatedLaptop.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: ${_updatedLaptop.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi Produk: ${_updatedLaptop.description}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: _editLaptop,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
