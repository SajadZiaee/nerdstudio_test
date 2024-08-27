import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_event.dart';

class ChatAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String backButtonSvgPath;
  final String historyButtonSvgPath;
  final String highlightButtonSvgPath;
  final VoidCallback onBackPressed;
  final VoidCallback onHistoryPressed;
  final VoidCallback onHighlightPressed;

  const ChatAppbar({
    Key? key,
    required this.title,
    required this.backButtonSvgPath,
    required this.historyButtonSvgPath,
    required this.highlightButtonSvgPath,
    required this.onBackPressed,
    required this.onHistoryPressed,
    required this.onHighlightPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 52,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(backButtonSvgPath, width: 24, height: 24),
        onPressed: onBackPressed,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF181818),
          fontSize: 14,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            BlocProvider.of<ChatBloc>(context).add(ToggleTranslationModeEvent());
          },
          icon: const Icon(
            Icons.translate,
            size: 16,
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(historyButtonSvgPath, width: 16, height: 16),
          onPressed: onHistoryPressed,
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: SvgPicture.asset(highlightButtonSvgPath, width: 16, height: 16),
          onPressed: onHighlightPressed,
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
