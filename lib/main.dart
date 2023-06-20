import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../ui/menupage.dart';
import './ui/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAeSSpTiP8qhwt8DY5HRB_os3LiW-IaA00', // Your apiKey
      appId: '1:822132938524:android:1830f7079ebd8d4db40cd9', // Your appId
      messagingSenderId: '822132938524', // Your messagingSenderId
      projectId: 'catalogue-app-63373', // Your projectId
      storageBucket: "catalogue-app-63373.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const MenuPage();
          } else {
            return const Login();
          }
        },
      ),
    );
  }
}
