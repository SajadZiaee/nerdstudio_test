import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_event.dart';
import 'package:nerd_test/shared/widgets/gradient_icon_button.dart';

class ChatBox extends StatelessWidget {
  final TextEditingController controller;

  const ChatBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 64,
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, // Add padding to account for keyboard
              left: 12,
              right: 12,
              top: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F6FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextField(
              maxLines: null,
              controller: controller,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'What is in your mind ?...',
                hintStyle: TextStyle(
                  color: Color(0xFFB9BAC0),
                  fontSize: 10,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 0.18,
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // Add padding to account for keyboard
            left: 12,
            right: 12,
            top: 8,
          ),
          child: GradientIconButton(
            svgPath: 'assets/images/send.svg',
            onPressed: () {
              final content = controller.text.trim();
              if (content.isNotEmpty) {
                BlocProvider.of<ChatBloc>(context).add(SendMessageEvent(content));
                controller.clear();
              }
            },
          ),
        ),
      ],
    );
  }
}
