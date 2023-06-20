import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/processor.dart';
import '../provider/firestore_service.dart';
import 'processor_form.dart';
import 'processor_detail.dart';
import 'package:flutter/material.dart';

class ProcessorListPage extends StatelessWidget {
  const ProcessorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Komputer'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const ProcessorForm();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('processors').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var processors = snapshot.data!.docs
                .map((processor) => Processor.fromSnapshot(processor))
                .toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 kolom
                childAspectRatio: 0.75, // Mengatur rasio lebar-tinggi card
              ),
              itemCount: processors.length,
              itemBuilder: (context, index) {
                var id = snapshot.data!.docs[index].id;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProcessorDetail(
                          processor: processors[index],
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
                              processors[index].imageUrl.isNotEmpty
                                  ? processors[index].imageUrl
                                  : 'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fproducts%2FNo_Image_.png?alt=media&token=bbf122c4-2185-4af2-b0a0-8b600eab6526',
                              height: 100,
                              width: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                processors[index].name,
                                maxLines: 1, // Batas maksimal 2 baris
                                overflow: TextOverflow
                                    .ellipsis, // Teks akan dipotong dengan titik-titik jika melebihi batas
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Rp. ' + processors[index].price,
                                maxLines: 1, // Batas maksimal 2 baris
                                overflow: TextOverflow
                                    .ellipsis, // Teks akan dipotong dengan titik-titik jika melebihi batas
                                style: const TextStyle(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              FirestoreService.deleteProcessor(id);
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
