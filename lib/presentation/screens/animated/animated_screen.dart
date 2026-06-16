import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  Color color = Colors.indigo;
  double borderRadius = 10;

  void changeShape() {
    final random = Random();

    width = (random.nextInt(300) + 50).toDouble();
    height = (random.nextInt(300) + 50).toDouble();
    color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    borderRadius = (random.nextInt(30) + 10).toDouble();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          width: width,
          height: height,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(borderRadius)),
          duration: Duration(milliseconds: 400),
          curve: Curves.bounceInOut,
        ),
      ),
    );
  }
}
