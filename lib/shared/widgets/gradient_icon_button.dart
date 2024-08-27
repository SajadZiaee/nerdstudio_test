import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nerd_test/core/utils/gradients.dart';

class GradientIconButton extends StatelessWidget {
  final String svgPath;
  final void Function()? onPressed;

  const GradientIconButton({
    Key? key,
    required this.svgPath,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppGradients.primaryGradientB,
        ),
        child: Center(
          child: SvgPicture.asset(
            svgPath,
            color: Colors.white, // Adjust the color as needed
            width: 18, // Adjust size of SVG icon
            height: 18,
          ),
        ),
      ),
    );
  }
}
