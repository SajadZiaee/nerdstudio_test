import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nerd_test/core/utils/colors.dart';

class StopRespondingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const StopRespondingButton({
    Key? key,
    required this.onPressed,
    this.text = 'Stop Responding',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 131,
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: ShapeDecoration(
          color: AppColors.primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 16,
              height: 16,
              child: SvgPicture.asset(
                'assets/images/player-stop-filled.svg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF9373EE),
                fontSize: 12,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
