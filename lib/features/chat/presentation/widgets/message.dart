import 'package:flutter/material.dart';
import 'package:nerd_test/core/utils/text_styles.dart';
import 'package:nerd_test/features/chat/presentation/widgets/chat_dialog.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final String time;
  final bool isUserMessage;
  final VoidCallback? onLongPress;

  const MessageWidget({
    Key? key,
    required this.message,
    required this.time,
    required this.isUserMessage,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => const ChatDialog(),
        );
      },
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUserMessage) ...[
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/ai_avatar.png'),
                radius: 18.5,
              ),
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isUserMessage ? Colors.white : const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: TextStyles.labelText,
                    ),
                    Align(
                      alignment: isUserMessage ? Alignment.bottomRight : Alignment.bottomLeft,
                      child: Text(
                        time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isUserMessage) ...[
              const SizedBox(width: 8),
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
                radius: 18.5,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
