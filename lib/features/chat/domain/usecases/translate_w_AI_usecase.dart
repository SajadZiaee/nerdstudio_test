import 'package:nerd_test/features/chat/domain/entities/message.dart';
import 'package:nerd_test/features/chat/domain/repositories/chat_repository.dart';

class TranslateWithAI {
  final ChatRepository repository;

  TranslateWithAI(this.repository);

  Stream<Message> call(String content) {
    return repository.translateMessage(content);
  }
}
