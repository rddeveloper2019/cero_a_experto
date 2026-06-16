import 'package:flutter/material.dart';

class AppTutorialScreen extends StatelessWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Tutorial'),
      ),
      body: Image.asset(
        'assets/images/1.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
