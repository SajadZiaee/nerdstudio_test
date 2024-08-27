import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isPassword;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyles.labelText,
          ),
          const SizedBox(height: 4),
          Container(
            width: 327,
            height: 36,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: ShapeDecoration(
              color: const Color(0xFFF8F8F8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: TextField(
              obscureText: isPassword,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Color(0xFFB9BAC0),
                  fontSize: 12,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
