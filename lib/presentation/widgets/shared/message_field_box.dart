import 'package:cero_a_experto/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageFieldBox extends StatefulWidget {
  final void Function(String? value) onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final key = ValueKey('ok');
  final textController = TextEditingController();
  final focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final enabledBorder = OutlineInputBorder(
      borderSide: BorderSide(color: colors.primary),
      borderRadius: BorderRadius.circular(20),
    );
    final focusedBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      filled: true,
      suffixIcon: IconButton(
        onPressed: () {
          widget.onValue(textController.text);
          textController.clear();
        },
        icon: Icon(Icons.send_outlined),
      ),
      hintText: 'Enter your message',
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: TextFormField(
        key: key,
        // textInputAction: TextInputAction.newline,
        onTapOutside: (PointerDownEvent? e) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        onChanged: (String? value) {
          print('(**) =>onChanged value:  ${value}');
        },
        onFieldSubmitted: (String? value) {
          widget.onValue(value);

          textController.clear();
          focusNode.requestFocus();
        },
        decoration: inputDecoration,
      ),
    );
  }
}
