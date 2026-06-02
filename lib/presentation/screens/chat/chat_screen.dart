import 'package:cero_a_experto/presentation/widgets/chat/her_message_bubble.dart';
import 'package:cero_a_experto/presentation/widgets/chat/my_message_bubble.dart';
import 'package:cero_a_experto/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://easydrawingguides.com/wp-content/uploads/2023/01/how-to-draw-an-easy-barbie-doll-face-featured-image-1200.png',
            ),
          ),
        ),
        title: Text('𝐦𝐲friend.ꨄ♥︎'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 90,
                itemBuilder: (BuildContext context, int index) {
                  if (index % 2 == 0) {
                    return HerMessageBubble();
                  }
                  return MyMessageBubble();
                },
              ),
            ),
            MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}
