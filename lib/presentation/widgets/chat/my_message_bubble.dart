import 'package:cero_a_experto/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;
  const MyMessageBubble({super.key, required this.message});

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
              message.text,
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
