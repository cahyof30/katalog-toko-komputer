import '../model/computer.dart';
import 'computer_form.dart';
import 'package:flutter/material.dart';

class ComputerDetail extends StatefulWidget {
  final Computer computer;
  final String id;

  const ComputerDetail({required this.computer, required this.id});

  @override
  _ComputerDetailState createState() => _ComputerDetailState();
}

class _ComputerDetailState extends State<ComputerDetail> {
  late Computer _updatedComputer;

  @override
  void initState() {
    super.initState();
    _updatedComputer = widget.computer;
  }

  Future<void> _editComputer() async {
    var updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComputerForm(
          computer: _updatedComputer,
          id: widget.id,
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        // Perbarui tampilan dengan data yang diterima
        _updatedComputer = Computer(
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
        title: Text(widget.computer.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _updatedComputer.imageUrl.isNotEmpty
                  ? _updatedComputer.imageUrl
                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Produk: ${_updatedComputer.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: ${_updatedComputer.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi Produk: ${_updatedComputer.description}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: _editComputer,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
