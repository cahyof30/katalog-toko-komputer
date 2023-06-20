import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/monitor.dart';
import '../provider/firestore_service.dart';
import 'monitor_form.dart';
import 'monitor_detail.dart';
import 'package:flutter/material.dart';

class MonitorListPage extends StatelessWidget {
  const MonitorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Monitor'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MonitorForm();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('monitors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var monitors = snapshot.data!.docs
                .map((monitor) => Monitor.fromSnapshot(monitor))
                .toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 kolom
                childAspectRatio: 0.82, // Mengatur rasio lebar-tinggi card
              ),
              itemCount: monitors.length,
              itemBuilder: (context, index) {
                var id = snapshot.data!.docs[index].id;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MonitorDetail(
                          monitor: monitors[index],
                          id: id,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 12.0), // Menambahkan jarak atas sebesar 8.0
                          child: FractionallySizedBox(
                            widthFactor: 0.8, // Mengisi 80% lebar ruang grid
                            child: Image.network(
                              monitors[index].imageUrl.isNotEmpty
                                  ? monitors[index].imageUrl
                                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                monitors[index].name,
                                maxLines: 1, // Batas maksimal 2 baris
                                overflow: TextOverflow
                                    .ellipsis, // Teks akan dipotong dengan titik-titik jika melebihi batas
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              FirestoreService.deleteMonitor(id);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
