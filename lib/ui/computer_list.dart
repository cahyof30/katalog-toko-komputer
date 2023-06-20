import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/computer.dart';
import '../provider/firestore_service.dart';
import 'computer_form.dart';
import 'computer_detail.dart';
import 'package:flutter/material.dart';

class ComputerListPage extends StatelessWidget {
  const ComputerListPage({Key? key}) : super(key: key);

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
                return const ComputerForm();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('computers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var computers = snapshot.data!.docs
                .map((computer) => Computer.fromSnapshot(computer))
                .toList();

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Menampilkan 2 kolom
                childAspectRatio: 0.75, // Mengatur rasio lebar-tinggi card
              ),
              itemCount: computers.length,
              itemBuilder: (context, index) {
                var id = snapshot.data!.docs[index].id;
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ComputerDetail(
                          computer: computers[index],
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
                              computers[index].imageUrl.isNotEmpty
                                  ? computers[index].imageUrl
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
                                computers[index].name,
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
                                'Rp. ' + computers[index].price,
                                maxLines: 1, // Batas maksimal 2 baris
                                overflow: TextOverflow
                                    .ellipsis, // Teks akan dipotong dengan titik-titik jika melebihi batas
                                style: const TextStyle(
                                  fontSize: 16,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Text(
                              //   computers[index].description,
                              //   maxLines: 2,
                              //   overflow: TextOverflow.ellipsis,
                              // ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () {
                              FirestoreService.deleteComputer(id);
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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../model/computer.dart';
// import '../provider/firestore_service.dart';
// import 'computer_form.dart';
// import 'computer_detail.dart';
// import 'package:flutter/material.dart';

// class ComputerListPage extends StatelessWidget {
//   const ComputerListPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Daftar Komputer'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(
//               builder: (context) {
//                 return const ComputerForm();
//               },
//             ));
//           },
//           child: const Icon(Icons.add),
//         ),
//         body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//           stream:
//               FirebaseFirestore.instance.collection('computers').snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var computers = snapshot.data!.docs
//                   .map((computer) => Computer.fromSnapshot(computer))
//                   .toList();

//               return ListView.builder(
//                 itemCount: computers.length,
//                 itemBuilder: (context, index) {
//                   var id = snapshot.data!.docs[index].id;
//                   return ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ComputerDetail(
//                             computer: computers[index],
//                             id: id,
//                           ),
//                         ),
//                       );
//                     },
//                     title: Text(computers[index].name),
//                     subtitle: Text(computers[index].description),
//                     trailing: IconButton(
//                         onPressed: () {
//                           FirestoreService.deleteComputer(id);
//                         },
//                         icon: const Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         )),
//                   );
//                 },
//               );
//             }

//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           },
//         ));
//   }
// }

// // Column(
// //           children: [
// // ListTile(
// //   onTap: () {
// //     Navigator.push(context, MaterialPageRoute(
// //       builder: (context) {
// //         return ProductPage();
// //       },
// //     ));
// //   },
// //   title: Text('Produk 1'),
// //   subtitle: Text('deskripsi 1'),
// // ),

// //           ],
// //         )
