import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogOption extends StatelessWidget {
  final String label;
  final String iconAssetPath;
  final VoidCallback onPressed;

  const DialogOption({
    Key? key,
    required this.label,
    required this.iconAssetPath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 18,
              height: 18,
              child: SvgPicture.asset(
                iconAssetPath,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF737373),
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

class ChatDialog extends StatelessWidget {
  const ChatDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 204,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: ShapeDecoration(
          color: const Color(0xFFFCFCFD),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 0.25, color: Color(0xFFEFEFEF)),
            borderRadius: BorderRadius.circular(8),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x144E4955),
              blurRadius: 12,
              offset: Offset(0, 12),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DialogOption(
              label: 'Reply',
              iconAssetPath: 'assets/images/reply.svg',
              onPressed: () {
                // Handle reply action
              },
            ),
            const SizedBox(height: 8),
            DialogOption(
              label: 'Copy',
              iconAssetPath: 'assets/images/copy.svg',
              onPressed: () {
                // Handle copy action
              },
            ),
            const SizedBox(height: 8),
            DialogOption(
              label: 'Pin',
              iconAssetPath: 'assets/images/pinned.svg',
              onPressed: () {
                // Handle pin action
              },
            ),
            const SizedBox(height: 8),
            DialogOption(
              label: 'Search in Google',
              iconAssetPath: 'assets/images/google.svg',
              onPressed: () {
                // Handle Google search action
              },
            ),
            const SizedBox(height: 8),
            DialogOption(
              label: 'Delete',
              iconAssetPath: 'assets/images/delete.svg',
              onPressed: () {
                // Handle delete action
              },
            ),
            const SizedBox(height: 8),
            DialogOption(
              label: 'Details',
              iconAssetPath: 'assets/images/details.svg',
              onPressed: () {
                // Handle details action
              },
            ),
          ],
        ),
      ),
    );
  }
}
