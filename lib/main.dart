import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 144, 18, 189)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Moon  Landing'),
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
  bool clicked=false;
  SMIInput<bool>? _pressed;
  void _onRiveInit(Artboard artboard) {
    final controller = StateMachineController.fromArtboard(artboard, 'Button');
    artboard.addController(controller!);
    _pressed = controller.findInput("Press");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text(widget.title),
      ),
     
body: Container(),
      floatingActionButton:  AnimatedContainer(
        padding: const EdgeInsets.only(top:200),
        alignment: clicked?Alignment.topRight : Alignment.bottomRight,
        duration: const Duration(seconds: 1),
        child: SizedBox(
          width: 100,
          height: 100,
          child: GestureDetector(
            onTapDown: (_) {
              setState(() {
                clicked=true;
              });
              _pressed?.value = true;
              
            },
            onTapCancel: () => _pressed?.value=false,
              onTapUp: (_) => _pressed?.value=false,
            child: RiveAnimation.asset(
              'assets/rocket.riv',
              onInit: _onRiveInit,
            ),
          ),
        ),
      ),
    );
  }
}
