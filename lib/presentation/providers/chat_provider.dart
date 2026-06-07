import 'package:cero_a_experto/config/helpers/get_yes_no_answer.dart';
import 'package:cero_a_experto/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messages = [
    Message(text: 'Hello Friend!', fromWho: FromWho.me),
    Message(text: 'How are you?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    messages.add(
      Message(text: text, fromWho: FromWho.me),
    );

    if (text.endsWith('?')) {
      await receiveMessage();
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> receiveMessage() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messages.add(herMessage);
  }

  void scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    chatScrollController.dispose();
    super.dispose();
  }
}
