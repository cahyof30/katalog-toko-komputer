import '../model/processor.dart';
import 'processor_form.dart';
import 'package:flutter/material.dart';

class ProcessorDetail extends StatefulWidget {
  final Processor processor;
  final String id;

  const ProcessorDetail({required this.processor, required this.id});

  @override
  _ProcessorDetailState createState() => _ProcessorDetailState();
}

class _ProcessorDetailState extends State<ProcessorDetail> {
  late Processor _updatedProcessor;

  @override
  void initState() {
    super.initState();
    _updatedProcessor = widget.processor;
  }

  Future<void> _editProcessor() async {
    var updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProcessorForm(
          processor: _updatedProcessor,
          id: widget.id,
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        // Perbarui tampilan dengan data yang diterima
        _updatedProcessor = Processor(
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
        title: Text(widget.processor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _updatedProcessor.imageUrl.isNotEmpty
                  ? _updatedProcessor.imageUrl
                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Produk: ${_updatedProcessor.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: ${_updatedProcessor.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi Produk: ${_updatedProcessor.description}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: _editProcessor,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
