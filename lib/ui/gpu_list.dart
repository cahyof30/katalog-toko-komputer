import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/gpu.dart';
import '../provider/firestore_service.dart';
import 'gpu_form.dart';
import 'gpu_detail.dart';
import 'package:flutter/material.dart';

class GpuListPage extends StatelessWidget {
  const GpuListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar GPU'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const GpuForm();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('gpus').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var gpus = snapshot.data!.docs
                .map((gpu) => Gpu.fromSnapshot(gpu))
                .toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 kolom
                childAspectRatio: 0.82, // Mengatur rasio lebar-tinggi card
              ),
              itemCount: gpus.length,
              itemBuilder: (context, index) {
                var id = snapshot.data!.docs[index].id;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GpuDetail(
                          gpu: gpus[index],
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
                              gpus[index].imageUrl.isNotEmpty
                                  ? gpus[index].imageUrl
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
                                gpus[index].name,
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
                              FirestoreService.deleteGpu(id);
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
