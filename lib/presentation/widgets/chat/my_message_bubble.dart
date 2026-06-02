import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  const MyMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Text(
              'Lorem ipsum',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
