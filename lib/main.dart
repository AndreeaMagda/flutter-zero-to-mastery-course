import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ztmcourse/providers.dart';

void main() {
  runApp(const ProviderScope(
      child: const MyApp())); //allows us to access to all the providers
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter=ref.watch(counterProvider);
    CounterNotifier counterController=ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SecondPage()));
            }, child: const Text("Go to second screen")),
          Text(
            "Counter: $counter",
            style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
           ElevatedButton(onPressed: (){
            counterController.add();
           }, child: const Text("Add :)"),
           )
          ],
        ),
      ),
    );
  }
}



class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter=ref.watch(counterProvider);
    CounterNotifier counterController=ref.watch(counterProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
            " Same Counter: $counter",
            style:const TextStyle(fontSize: 30,fontWeight: FontWeight.bold, color: Colors.deepOrange),
          ),
           ElevatedButton(onPressed: (){
            counterController.add();
           }, child: const Text("Add :)"),
           )
          ],
        ),
      ),
    );
  }
}