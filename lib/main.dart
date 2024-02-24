import 'package:flutter/material.dart';
import 'package:ztmcourse/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'ToDo App',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
