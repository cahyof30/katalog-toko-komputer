import '../model/gpu.dart';
import 'gpu_form.dart';
import 'package:flutter/material.dart';

class GpuDetail extends StatefulWidget {
  final Gpu gpu;
  final String id;

  const GpuDetail({required this.gpu, required this.id});

  @override
  _GpuDetailState createState() => _GpuDetailState();
}

class _GpuDetailState extends State<GpuDetail> {
  late Gpu _updatedGpu;

  @override
  void initState() {
    super.initState();
    _updatedGpu = widget.gpu;
  }

  Future<void> _editGpu() async {
    var updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GpuForm(
          gpu: _updatedGpu,
          id: widget.id,
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        // Perbarui tampilan dengan data yang diterima
        _updatedGpu = Gpu(
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
        title: Text(widget.gpu.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _updatedGpu.imageUrl.isNotEmpty
                  ? _updatedGpu.imageUrl
                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Produk: ${_updatedGpu.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: ${_updatedGpu.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi Produk: ${_updatedGpu.description}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: _editGpu,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
