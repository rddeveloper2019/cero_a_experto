import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  const MessageFieldBox({super.key});

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
          textController.clear();
        },
        icon: Icon(Icons.send_outlined),
      ),
      hintText: 'Enter your message',
    );
    return TextFormField(
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
        print('(**) =>onFieldSubmitted value:  ${textController.text}');
        textController.clear();
        focusNode.requestFocus();
      },
      decoration: inputDecoration,
    );
  }
}
