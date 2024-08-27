import 'package:nerd_test/features/chat/domain/entities/message.dart';

class MessageModel extends Message {
  MessageModel({
    required String content,
    required String role,
  }) : super(content: content, role: role);

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      content: json['content'] as String,
      role: json['role'] as String? ?? 'assistant',
    );
  }
}
