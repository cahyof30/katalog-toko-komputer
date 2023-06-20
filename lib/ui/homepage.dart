import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product.dart';
import '../provider/firestore_service.dart';
import '../ui/product_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Produk'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const ProductPage();
              },
            ));
          },
          child: const Icon(Icons.add),
        ),
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance.collection('products').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var products = snapshot.data!.docs
                  .map((product) => Product.fromSnapshot(product))
                  .toList();

              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  var id = snapshot.data!.docs[index].id;
                  return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ProductPage(
                            product: products[index],
                            id: id,
                          );
                        },
                      ));
                    },
                    title: Text(products[index].name),
                    subtitle: Text(products[index].description),
                    trailing: IconButton(
                        onPressed: () {
                          FirestoreService.deleteProduct(id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}

// Column(
//           children: [
// ListTile(
//   onTap: () {
//     Navigator.push(context, MaterialPageRoute(
//       builder: (context) {
//         return ProductPage();
//       },
//     ));
//   },
//   title: Text('Produk 1'),
//   subtitle: Text('deskripsi 1'),
// ),

//           ],
//         )
