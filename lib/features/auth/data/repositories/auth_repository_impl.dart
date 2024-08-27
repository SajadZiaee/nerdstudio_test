import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:nerd_test/core/error/failure.dart';
import 'package:nerd_test/features/auth/domain/entities/user_entity.dart';
import 'package:nerd_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:nerd_test/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:nerd_test/features/auth/data/datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      await localDataSource.cacheUserData(userModel);

      final accessToken = userModel.accessToken;
      if (accessToken != null) {
        await localDataSource.cacheAccessToken(accessToken);
      }

      return Right(userModel);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message ?? 'An unexpected error occurred'));
    }
    // catch (e) {
    //   print(e.toString());
    //   return Left(ServerFailure(message: 'An unexpected error occurred'));
    // }
  }

  @override
  Future<Either<Failure, UserEntity>> register(String email, String username, String password) async {
    try {
      final userModel = await remoteDataSource.register(email, username, password);
      await localDataSource.cacheUserData(userModel);

      final accessToken = userModel.accessToken;
      if (accessToken != null) {
        await localDataSource.cacheAccessToken(accessToken);
      }

      return Right(userModel);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.message ?? 'An unexpected error occurred'));
    } catch (e) {
      return Left(ServerFailure(message: 'An unexpected error occurred'));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearUserData();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      return await localDataSource.getAccessToken();
    } catch (e) {
      return null;
    }
  }
}
