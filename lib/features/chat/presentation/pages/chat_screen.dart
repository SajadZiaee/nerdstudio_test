import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_state.dart';
import 'package:nerd_test/features/chat/presentation/widgets/chat_appbar.dart';
import 'package:nerd_test/features/chat/presentation/widgets/chatbox.dart';
import 'package:nerd_test/features/chat/presentation/widgets/hold_message_appbar.dart';
import 'package:nerd_test/features/chat/presentation/widgets/message.dart';
import 'package:nerd_test/features/chat/presentation/widgets/stop_responding_button.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isEditing = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: _isEditing
              ? HoldMessageAppbar(
                  onClosePressed: () {
                    setState(() {
                      _isEditing = false;
                    });
                  },
                  onDetailsPressed: () {},
                  onDeletePressed: () {},
                  onGooglePressed: () {},
                  onPinPressed: () {},
                  onCopyPressed: () {},
                )
              : ChatAppbar(
                  title: 'Chat AI',
                  backButtonSvgPath: 'assets/images/chevron-left.svg',
                  historyButtonSvgPath: 'assets/images/history.svg',
                  highlightButtonSvgPath: 'assets/images/highlight.svg',
                  onBackPressed: () {},
                  onHistoryPressed: () {},
                  onHighlightPressed: () {},
                ) as PreferredSizeWidget,
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      // bottom: MediaQuery.of(context).viewInsets.bottom, // Add padding for keyboard
                      ),
                  child: _buildBody(state),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: _buildFloatingActionButton(state),
          bottomSheet: Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: ChatBox(controller: _controller),
          ),
        );
      },
    );
  }

  Widget _buildBody(ChatState state) {
    if (state is ChatInitial) {
      return Column(
        children: [
          SvgPicture.asset('assets/images/Frame.svg'),
          const Center(child: Text('Ask AI a question!')),
        ],
      );
    } else if (state is ChatLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (state is ChatLoaded || state is TranslationModeToggled) {
      final messages = state is ChatLoaded ? state.messages : (state as TranslationModeToggled).messages;

      return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return MessageWidget(
            message: message.content,
            time: '12:00 PM',
            isUserMessage: message.role == 'user',
            onLongPress: _onMessageLongPress,
            isStreaming: index == messages.length - 1 && message.role == 'assistant',
          );
        },
      );
    } else if (state is ChatFailure) {
      return Center(child: Text(state.error));
    }
    return Container();
  }

  Widget _buildFloatingActionButton(ChatState state) {
    if (state is ChatLoaded) {
      return StopRespondingButton(
        onPressed: () {
          // Implement stop responding functionality
        },
      );
    }
    return Container();
  }

  void _onMessageLongPress() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }
}
