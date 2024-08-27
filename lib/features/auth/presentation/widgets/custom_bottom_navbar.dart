import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              painter: BottomNavBarPainter(),
              child: Container(
                height: 130,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintPurple = Paint()
      ..color = AppColors.primaryColor.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final paintPink = Paint()
      ..color = AppColors.primaryColor.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    final pathPurple = Path();
    final pathPink = Path();

    // Purple Path
    pathPurple.moveTo(0, 0);
    pathPurple.quadraticBezierTo(size.width * 0.25, size.height * 0.9, size.width * 0.5, size.height * 0.5);
    pathPurple.quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.1);
    pathPurple.lineTo(size.width, size.height);
    pathPurple.lineTo(0, size.height);
    pathPurple.close();

    pathPink.moveTo(0, size.height * 0.2);
    pathPink.quadraticBezierTo(size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.7);
    pathPink.quadraticBezierTo(size.width * 0.75, size.height * 0.9, size.width, size.height * 0.3);
    pathPink.lineTo(size.width, size.height);
    pathPink.arcToPoint(
      Offset(size.width - 60, size.height),
      radius: const Radius.circular(60),
      clockwise: false,
    );
    pathPink.lineTo(0, size.height);
    pathPink.close();

    canvas.drawPath(pathPurple, paintPurple);
    canvas.drawPath(pathPink, paintPink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
