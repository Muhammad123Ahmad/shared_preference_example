import 'package:flutter/material.dart';
import 'package:shared_prefrence_example/home_screen.dart';
//import 'package:shared_prefrence_example/sign_up.dart';
//import 'home_screen.dart'; // Import the file containing your HomeScreen widget

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
