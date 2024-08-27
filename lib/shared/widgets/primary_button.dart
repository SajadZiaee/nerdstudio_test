import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/colors.dart';
import 'package:nerd_test/core/utils/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
            height: 48,
            decoration: ShapeDecoration(
              color: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyles.primaryTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
