import 'package:nerd_test/features/chat/data/datasources/message_remote_datasource.dart';
import 'package:nerd_test/features/chat/domain/repositories/chat_repository.dart';
import 'package:nerd_test/features/chat/data/models/message_model.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;

  ChatRepositoryImpl({required this.remoteDataSource});

  @override
  Stream<MessageModel> chatWithAI(String content) {
    return remoteDataSource.chatWithAI(content);
  }

  @override
  Stream<MessageModel> translateMessage(String content) {
    return remoteDataSource.translateMessage(content);
  }
}
