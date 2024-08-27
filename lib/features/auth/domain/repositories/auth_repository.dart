import 'package:dartz/dartz.dart';
import 'package:nerd_test/core/error/failure.dart';
import 'package:nerd_test/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<Either<Failure, UserEntity>> register(String email, String username, String password);
  Future<Either<Failure, void>> logout();
  Future<String?> getAccessToken(); 
}
