import 'package:equatable/equatable.dart';
import 'package:nerd_test/features/chat/domain/entities/message.dart';

abstract class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatLoaded extends ChatState {
  final List<Message> messages;

  const ChatLoaded({required this.messages});

  @override
  List<Object> get props => [messages];
}

class ChatFailure extends ChatState {
  final String error;

  const ChatFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class TranslationModeToggled extends ChatState {
  final List<Message> messages;
  final bool isTranslationMode;

  const TranslationModeToggled({
    required this.messages,
    required this.isTranslationMode,
  });

  @override
  List<Object> get props => [messages, isTranslationMode];
}
