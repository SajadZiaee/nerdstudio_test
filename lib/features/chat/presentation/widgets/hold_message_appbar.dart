import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nerd_test/core/utils/colors.dart'; // Import for SVG handling

class HoldMessageAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClosePressed;
  final VoidCallback onDetailsPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onGooglePressed;
  final VoidCallback onPinPressed;
  final VoidCallback onCopyPressed;

  const HoldMessageAppbar({
    Key? key,
    required this.onClosePressed,
    required this.onDetailsPressed,
    required this.onDeletePressed,
    required this.onGooglePressed,
    required this.onPinPressed,
    required this.onCopyPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52,
      backgroundColor: AppColors.textFieldBgColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/images/close.svg',
          width: 18,
          height: 18,
        ),
        onPressed: onClosePressed,
      ),
      title: null,
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/details.svg',
            width: 18,
            height: 18,
          ),
          onPressed: onDetailsPressed,
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/delete.svg',
            width: 18,
            height: 18,
          ),
          onPressed: onDeletePressed,
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/google.svg',
            width: 18,
            height: 18,
          ),
          onPressed: onGooglePressed,
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/pinned.svg',
            width: 18,
            height: 18,
          ),
          onPressed: onPinPressed,
        ),
        IconButton(
          icon: SvgPicture.asset(
            'assets/images/copy.svg',
            width: 18,
            height: 18,
          ),
          onPressed: onCopyPressed,
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
