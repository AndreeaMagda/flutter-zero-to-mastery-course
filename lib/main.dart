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
  void _incrementCounter() {
    setState(() {});
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
            //data navigation using basic navigation
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FirstPage(name: "hamster"),
                  ),
                );
              },
              child: const Text('First Page'),
            ),
            //data navigation using named navigation
            TextButton(
              onPressed: () async {
                final response = await Navigator.pushNamed(context, "/second",
                    arguments: "Magdyz");
                print(response);
              },
              child: const Text('Second Page'),
            ),
          ],
        ),
      ),
    );
  }
}
