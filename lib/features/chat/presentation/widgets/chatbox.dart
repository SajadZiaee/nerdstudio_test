import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final TextEditingController controller;
  const ChatBox({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width - 64,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
    );
  }
}
