import 'package:flutter/material.dart';
import 'package:ztmcourse/pages/first.dart';
import 'package:ztmcourse/pages/second.dart';

void main() {
  runApp(const MagdyzApp());
}

class MagdyzApp extends StatelessWidget {
  const MagdyzApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const MyHomePage(title: 'Home Page'),
        '/first': (context) => const FirstPage(),
        '/second': (context) => const SecondPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/first");
              },
              child: const Text('First Page'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second");
              },
              child: const Text('Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
