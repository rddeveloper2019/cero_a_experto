import 'package:cero_a_experto/config/constants/environment.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cinemapedia'),
      ),
      body: Column(
        children: [
          Text(Environment.apiKey),
          Text(Environment.apiReadAccessToken),
          Text(Environment.accountId.toString()),
        ],
      ),
    );
  }
}
