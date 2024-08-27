import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nerd_test/features/auth/data/app_database.dart';
import 'package:nerd_test/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nerd_test/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:nerd_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:nerd_test/features/auth/domain/usecases/get_access_token_usecase.dart';
import 'package:nerd_test/features/auth/domain/usecases/login_usecase.dart';
import 'package:nerd_test/features/auth/domain/usecases/register_usecase.dart';
import 'package:nerd_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:nerd_test/features/auth/presentation/pages/start_screen.dart';
import 'package:nerd_test/features/chat/data/datasources/message_remote_datasource.dart';
import 'package:nerd_test/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:nerd_test/features/chat/domain/usecases/chat_w_AI_usecase.dart';
import 'package:nerd_test/features/chat/domain/usecases/translate_w_AI_usecase.dart';
import 'package:nerd_test/features/chat/presentation/bloc/chat_bloc.dart';
import 'package:nerd_test/features/chat/presentation/pages/chat_screen.dart';
import 'package:nerd_test/shared/global/application_global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  final db = AppDatabase();
  final authRemoteDataSource = AuthRemoteDataSourceImpl(dio: dio);
  final authLocalDataSource = AuthLocalDataSourceImpl(db: db);
  final authRepository = AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSource,
    localDataSource: authLocalDataSource,
  );
  final loginUseCase = LoginUseCase(authRepository);
  final registerUseCase = RegisterUseCase(authRepository);
  final getAccessTokenUseCase = GetAccessTokenUseCase(authRepository);

  final accessToken = await getAccessTokenUseCase();
  if (accessToken != null) {
    ApplicationGlobal.setAccessToken(accessToken);
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            loginUseCase: loginUseCase,
            registerUseCase: registerUseCase,
          ),
        ),
        BlocProvider<ChatBloc>(
            create: (context) => ChatBloc(
                chatWithAI: ChatWithAI(ChatRepositoryImpl(remoteDataSource: ChatRemoteDataSourceImpl(dio: dio))),
                translateWithAI: TranslateWithAI(ChatRepositoryImpl(remoteDataSource: ChatRemoteDataSourceImpl(dio: dio)))))
      ],
      child: MyApp(accessToken: accessToken),
    ),
  );
}

class MyApp extends StatelessWidget {
  final String? accessToken;

  const MyApp({Key? key, required this.accessToken}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nerd Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: accessToken != null ? const ChatScreen() : const StartScreen(),
    );
  }
}
