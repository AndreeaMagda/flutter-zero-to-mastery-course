import 'package:flutter/material.dart';
import 'dart:math' as math;

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
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 13, 95, 44)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Art Class'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CustomPaint(
        painter: MyPainter(),
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linearPaint = Paint()..strokeWidth = 10;
    canvas.drawLine(const Offset(50, 150), const Offset(150, 220), linearPaint);
    canvas.drawLine(Offset(size.width - 50, 150), Offset(size.width - 150, 220),
        linearPaint);
    Paint circlePaint = Paint()..color = Colors.blueGrey;
    canvas.drawCircle(const Offset(100, 250), 20, circlePaint);
    canvas.drawCircle(Offset(size.width - 100, 250), 20, circlePaint);

    Paint arcPaint = Paint()
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = Colors.redAccent;
    Rect rect = const Rect.fromLTWH(105, 350, 220, 300);
    canvas.drawArc(rect, math.pi, math.pi, true, arcPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
