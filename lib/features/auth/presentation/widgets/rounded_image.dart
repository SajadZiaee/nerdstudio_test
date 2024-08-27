import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final double padding;
  final String imageFileName;
  final BoxFit boxFit;
  final double borderRadius;
  const RoundedImage(
      {super.key, required this.imageFileName, this.padding = 25, this.boxFit = BoxFit.cover, this.borderRadius = 25});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(imageFileName),
          fit: boxFit,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
