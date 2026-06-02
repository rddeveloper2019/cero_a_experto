import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

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
              'Lorem ipsum',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
              textAlign: TextAlign.start,
            ),
          ),
        ),
        SizedBox(height: 10),
        _ImageBubble(),
        SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        'https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif',
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
