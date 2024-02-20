import 'package:flutter/material.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name=ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title:  Text("Hello, $name"),
        centerTitle: true,
      ),
      body: TextButton(onPressed: (){
        Navigator.of(context).pop("This is from the second screen");  
      }, child: const Text('Pop'))
    );
  }
}