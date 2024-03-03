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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool state = true;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
      lowerBound: 0.5,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _animationController,
              child: Container(
                width: 200,
                height: 200,
                color: const Color.fromARGB(255, 130, 160, 96),
              ),
            ),
            AnimatedContainer(
              width: state ? 100 : 200,
              height: state ? 100 : 200,
              color: Colors.greenAccent,
              duration: const Duration(seconds: 2),
              child: AnimatedPadding(
                padding: EdgeInsets.all(state ? 35 : 8),
                duration: const Duration(seconds: 2),
               
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (state) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
          setState(() {
            state = !state;
          });
        },
        child: const Icon(Icons.change_circle_outlined),
      ),
    );
  }
}
