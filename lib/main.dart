import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              padding: const EdgeInsets.all(20),
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 152, 125, 199),
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: PageView(
                children: const [
                  Text(
                    "Andreea",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Magdyz",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Hammy",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Luna",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Harry",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Ron",
                    style: TextStyle(fontSize: 20),
                  ),
                                    Text(
                    "Andreea",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Magdyz",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            SizedBox(height: 100),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
