import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:nerd_test/features/chat/data/models/message_model.dart';
import 'package:nerd_test/shared/global/application_global.dart';

abstract class ChatRemoteDataSource {
  Stream<MessageModel> chatWithAI(String content);
  Stream<MessageModel> translateMessage(String content);
}

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  final Dio dio;

  ChatRemoteDataSourceImpl({required this.dio});

  @override
  Stream<MessageModel> chatWithAI(String content) async* {
    final dio = Dio();
    String? accessToken = ApplicationGlobal().accessToken;

    try {
      final response = await dio.post(
        'http://5.78.55.161:8000/v1/api/ai_writers/generate_AI_writer/',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
          responseType: ResponseType.stream,
        ),
        data: {
          "document_name": "New Document",
          "frequency_penalty": 0,
          "max_tokens": 250,
          "messages": [
            {"content": "you are a helpful assistant.", "role": "system"},
            {"content": content, "role": "user"}
          ],
          "model": "gpt-3.5-turbo-0125",
          "presence_penalty": 0,
          "stream": true,
          "temperature": 0.3,
          "top_p": 1,
          "workspace_id": 245
        },
      );

      if (response.statusCode == 200) {
        final stream = response.data.stream;
        await for (final data in stream) {
          final decodedData = utf8.decode(data);

          final jsonData = jsonDecode(decodedData.replaceFirst('data: ', '').trim());
          if (jsonData != null) {
            final message = MessageModel.fromJson(jsonData);
            yield message;
          }
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Stream<MessageModel> translateMessage(String content) async* {
    final dio = Dio();
    String? accessToken = ApplicationGlobal().accessToken;

    try {
      final response = await dio.post(
        'http://5.78.55.161:8000/v1/api/translates/generate_translate/',
        options: Options(
          headers: {'Authorization': 'Bearer $accessToken'},
          responseType: ResponseType.stream,
        ),
        data: {
          "document_name": "New Document",
          "frequency_penalty": 0,
          "max_tokens": 100,
          "messages": [
            {
              "content": "You will be provided with a sentence in English, and your task is to translate it into French.",
              "role": "system"
            },
            {"content": content, "role": "user"}
          ],
          "model": "gpt-3.5-turbo-0125",
          "presence_penalty": 0,
          "stream": true,
          "temperature": 0.3,
          "top_p": 1,
          "workspace_id": 245
        },
      );

      if (response.statusCode == 200) {
        final stream = response.data.stream;

        // Buffer to accumulate partial data
        final buffer = StringBuffer();

        // Listen to the stream
        await for (final chunk in stream) {
          // Convert chunk of bytes to string and accumulate
          final decodedData = utf8.decode(chunk);
          buffer.write(decodedData);

          // Process the accumulated data
          final dataString = buffer.toString();
          final dataChunks = dataString.split('\n\n').where((chunk) => chunk.trim().isNotEmpty && chunk.contains('data:'));

          for (var chunk in dataChunks) {
            final jsonString = chunk.replaceFirst('data: ', '').trim();
            if (jsonString.isNotEmpty) {
              final jsonData = jsonDecode(jsonString);

              if (jsonData['content'] != null) {
                final message = MessageModel.fromJson(jsonData);
                yield message;
              }
            }
          }

          // Clear the buffer after processing
          buffer.clear();
        }
      } else {
        print('Failed with status code: ${response.statusCode}');
        throw DioException(requestOptions: response.requestOptions);
      }
    } catch (e) {
      print('Request failed with error: $e');
      rethrow;
    }
  }
}
