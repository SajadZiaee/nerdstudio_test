import 'package:dio/dio.dart';
import 'package:nerd_test/features/auth/data/models/user_model.dart';
import 'package:nerd_test/shared/global/application_global.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String email, String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(
      'http://5.78.55.161:8000/v1/api/auth/login/',
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      response.data['workspace']['user']['access_token'] = response.data['access_token'];
      ApplicationGlobal.setAccessToken(response.data['access_token']);

      return UserModel.fromJson(response.data['workspace']['user']);
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }

  @override
  Future<UserModel> register(String email, String username, String password) async {
    final response = await dio.post(
      'http://5.78.55.161:8000/v1/api/auth/register/',
      data: {'email': email, 'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(response.data);
    } else {
      throw DioException(requestOptions: response.requestOptions);
    }
  }
}
