import 'package:flutter/material.dart';

class GradientTextButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Gradient gradient;
  final Function onPressed;

  const GradientTextButton({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.gradient,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: ShaderMask(
        shaderCallback: (bounds) => gradient.createShader(bounds),
        child: Text(
          text,
          style: textStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
