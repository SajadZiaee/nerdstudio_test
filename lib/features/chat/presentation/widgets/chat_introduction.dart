import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatIntroduction extends StatelessWidget {
  const ChatIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SvgPicture.asset('assets/images/Frame.svg'),
        SizedBox(
          height: 16,
        ),
        Text(
          'Start Chat with AI\n',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF737373),
            fontSize: 24,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            height: 0.03,
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          'Fill in the App to see the result! Introduction',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFB9BAC0),
            fontSize: 14,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        ),
      ],
    );
  }
}
