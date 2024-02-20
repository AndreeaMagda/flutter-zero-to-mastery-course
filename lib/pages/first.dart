import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('First Page'),
        centerTitle: true,
      ),
      body: TextButton(onPressed: (){
        Navigator.of(context).pop();  
      }, child: const Text('Pop'))
    );
  }
}