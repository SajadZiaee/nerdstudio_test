import 'package:nerd_test/features/chat/domain/entities/message.dart';

abstract class ChatRepository {
  Stream<Message> chatWithAI(String content);
  Stream<Message> translateMessage(String content);
}
