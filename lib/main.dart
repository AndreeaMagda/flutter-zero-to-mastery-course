import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 28, 129, 97)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Implicit Animation'),
      debugShowCheckedModeBanner: false,
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
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              width: state ? 100 : 200,
              height: state ? 100 : 200,
              color: Colors.greenAccent,
              duration: const Duration(seconds: 2),
              child: AnimatedPadding(
                padding: EdgeInsets.all(state ? 35 : 8),
                duration: const Duration(seconds: 2),
                child: const Text("Hey"),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            state = !state;
          });
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
