import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/colors.dart';
import 'package:nerd_test/core/utils/text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const SecondaryButton({super.key, required this.onPressed, required this.text});

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
              color: AppColors.primaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyles.secondaryTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
