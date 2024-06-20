import 'package:flutter/material.dart';
import 'package:passwordgenerator/passwordgeneartion.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Implement ==
    return const MaterialApp(
      home: Passwordgeneration(),
    );
  }
}
