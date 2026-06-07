import 'package:cero_a_experto/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
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
        if (message.imageUrl != null)
          _ImageBubble(
            imageUrl: message.imageUrl!,
          ),
        SizedBox(height: 5),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;
  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget image, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return image;
          }
          return Container(
            width: size.width * 0.7,
            height: 150,
            color: Colors.grey,
            child: Center(
              child: Text(
                'Loading ...',
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                textAlign: TextAlign.start,
              ),
            ),
          );
        },
      ),
    );
  }
}
