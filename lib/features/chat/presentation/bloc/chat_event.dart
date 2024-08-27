import 'package:equatable/equatable.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class SendMessageEvent extends ChatEvent {
  final String message;

  const SendMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

class StreamMessageEvent extends ChatEvent {
  final String message;

  const StreamMessageEvent(this.message);

  @override
  List<Object> get props => [message];
}

class ToggleTranslationModeEvent extends ChatEvent {}
