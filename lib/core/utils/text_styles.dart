import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/colors.dart';

class TextStyles {
  static const TextStyle primaryTextStyle = TextStyle(
    color: Color(0xFFF1FCFF),
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 0.09,
  );
  static const TextStyle secondaryTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 0.09,
  );
  static const TextStyle heading1 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 48,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    height: 0,
  );
  static const TextStyle heading2 = TextStyle(
    color: AppColors.textBlack,
    fontSize: 24,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    height: 0.03,
  );

  static const TextStyle labelText = TextStyle(
    color: Color(0xFF181818),
    fontSize: 12,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 0,
  );
}
