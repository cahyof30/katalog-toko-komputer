import '../model/monitor.dart';
import 'monitor_form.dart';
import 'package:flutter/material.dart';

class MonitorDetail extends StatefulWidget {
  final Monitor monitor;
  final String id;

  const MonitorDetail({required this.monitor, required this.id});

  @override
  _MonitorDetailState createState() => _MonitorDetailState();
}

class _MonitorDetailState extends State<MonitorDetail> {
  late Monitor _updatedMonitor;

  @override
  void initState() {
    super.initState();
    _updatedMonitor = widget.monitor;
  }

  Future<void> _editMonitor() async {
    var updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MonitorForm(
          monitor: _updatedMonitor,
          id: widget.id,
        ),
      ),
    );

    if (updatedData != null) {
      setState(() {
        // Perbarui tampilan dengan data yang diterima
        _updatedMonitor = Monitor(
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
        title: Text(widget.monitor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              _updatedMonitor.imageUrl.isNotEmpty
                  ? _updatedMonitor.imageUrl
                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            Text(
              'Nama Produk: ${_updatedMonitor.name}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Harga: ${_updatedMonitor.price}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Deskripsi Produk: ${_updatedMonitor.description}',
              style: const TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: _editMonitor,
              child: const Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
