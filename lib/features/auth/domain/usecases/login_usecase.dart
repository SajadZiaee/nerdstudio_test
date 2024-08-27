import 'package:dartz/dartz.dart';
import 'package:nerd_test/core/error/failure.dart';
import 'package:nerd_test/core/usecases/usecase.dart';
import 'package:nerd_test/features/auth/domain/entities/user_entity.dart';
import 'package:nerd_test/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase implements UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
