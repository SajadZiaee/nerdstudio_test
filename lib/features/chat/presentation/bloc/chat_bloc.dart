import 'package:bloc/bloc.dart';
import 'package:nerd_test/features/chat/domain/usecases/chat_w_AI_usecase.dart';
import 'package:nerd_test/features/chat/domain/usecases/translate_w_AI_usecase.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_event.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_state.dart';
import 'package:nerd_test/features/chat/domain/entities/message.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatWithAI chatWithAI;
  final TranslateWithAI translateWithAI;
  String _currentMessageContent = '';
  bool _isAccumulating = false;
  bool _isTranslationMode = false;

  ChatBloc({
    required this.chatWithAI,
    required this.translateWithAI,
  }) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
    on<StreamMessageEvent>(_onStreamMessage);
    on<ToggleTranslationModeEvent>(_onToggleTranslationMode);
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    final currentState = state;
    List<Message> messages = [];

    if (currentState is ChatLoaded) {
      messages = List<Message>.from(currentState.messages);
    } else if (currentState is TranslationModeToggled) {
      messages = List<Message>.from(currentState.messages);
    }

    messages.add(Message(content: event.message, role: 'user'));
    emit(ChatLoaded(messages: messages));

    _currentMessageContent = '';
    _isAccumulating = true;

    try {
      final responseStream = _isTranslationMode ? translateWithAI(event.message) : chatWithAI(event.message);

      responseStream.listen((message) {
        if (_isAccumulating) {
          _currentMessageContent += message.content;
        }
      }, onDone: () {
        if (_isAccumulating && _currentMessageContent.isNotEmpty) {
          add(StreamMessageEvent(_currentMessageContent));
          _currentMessageContent = '';
          _isAccumulating = false;
        }
      });
    } catch (e) {
      emit(ChatFailure(error: e.toString()));
    }
  }

  void _onStreamMessage(StreamMessageEvent event, Emitter<ChatState> emit) {
    final currentState = state;
    List<Message> messages = [];

    if (currentState is ChatLoaded) {
      messages = List<Message>.from(currentState.messages);
    } else if (currentState is TranslationModeToggled) {
      messages = List<Message>.from(currentState.messages);
    }

    messages.add(Message(content: event.message, role: 'assistant'));

    emit(
      _isTranslationMode
          ? TranslationModeToggled(messages: messages, isTranslationMode: _isTranslationMode)
          : ChatLoaded(messages: messages),
    );
  }

  void _onToggleTranslationMode(ToggleTranslationModeEvent event, Emitter<ChatState> emit) {
    _isTranslationMode = !_isTranslationMode;
    print(_isTranslationMode);
    if (state is ChatLoaded) {
      emit(TranslationModeToggled(
        messages: (state as ChatLoaded).messages,
        isTranslationMode: _isTranslationMode,
      ));
    } else if (state is TranslationModeToggled) {
      emit(TranslationModeToggled(
        messages: (state as TranslationModeToggled).messages,
        isTranslationMode: _isTranslationMode,
      ));
    } else {
      emit(TranslationModeToggled(
        messages: [],
        isTranslationMode: _isTranslationMode,
      ));
    }
  }
}
