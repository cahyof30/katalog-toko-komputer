import 'package:flutter/material.dart';
import 'computer_list.dart';
import 'monitor_list.dart';
import 'laptop_list.dart';
import 'processor_list.dart';
import 'gpu_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widget/sidebar.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: SingleChildScrollView(
        // Menggunakan SingleChildScrollView agar tampilan dapat di-scroll
        child: Column(
          children: [
            CarouselSlider(
              items: [
                // Daftar gambar untuk carousel
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fcarousel1.jpg?alt=media&token=589f4e71-81e5-4d05-a5f3-e184ca93cf9c',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fcarousel2.jpg?alt=media&token=60605a4a-0018-45fb-93ec-97f670783ac0',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fcarousel3.jpg?alt=media&token=ff9e2e21-2459-452c-a059-0022cac4183d',
                  fit: BoxFit.cover,
                ),
              ],
              options: CarouselOptions(
                // Opsi untuk konfigurasi carousel
                aspectRatio: 16 / 9,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
              ),
            ),
            const SizedBox(height: 16),
            GridView.count(
              physics:
                  const NeverScrollableScrollPhysics(), // Menghilangkan scroll di dalam GridView
              shrinkWrap:
                  true, // Mengizinkan GridView di-wrap agar sesuai dengan jumlah item
              crossAxisCount: 2, // Menampilkan 2 kolom
              childAspectRatio: 0.95, // Mengatur rasio lebar-tinggi kotak
              padding:
                  const EdgeInsets.all(8.0), // Padding untuk batas antara menu
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ComputerListPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fcpu-picture.png?alt=media&token=3fa865ce-7707-4f2e-b213-746e44d449c8',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Computer List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MonitorListPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fmonitor.png?alt=media&token=bd0d7f6f-ba1e-4a31-9c05-426e1fd057d7',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Monitor List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LaptopListPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Flaptop.png?alt=media&token=605f70dd-206f-480f-bfb3-a92143c757e1',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Laptop List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProcessorListPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fprocessor.png?alt=media&token=830c6f44-09ea-4497-80bd-6ca199a1b63f',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Processor List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const GpuListPage(),
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/catalogue-app-63373.appspot.com/o/assets%2Fhomepage%2Fgpu.png?alt=media&token=8ead5b75-de38-4c98-8bf5-676846f18416',
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'GPU List',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
