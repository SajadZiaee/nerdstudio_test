import 'package:nerd_test/features/chat/domain/entities/message.dart';
import 'package:nerd_test/features/chat/domain/repositories/chat_repository.dart';

class ChatWithAI {
  final ChatRepository repository;

  ChatWithAI(this.repository);

  Stream<Message> call(String content) {
    return repository.chatWithAI(content);
  }
}
