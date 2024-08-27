import 'package:dartz/dartz.dart';
import 'package:nerd_test/core/error/failure.dart';
import 'package:nerd_test/core/usecases/usecase.dart';
import 'package:nerd_test/features/auth/domain/entities/user_entity.dart';
import 'package:nerd_test/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase implements UseCase<UserEntity, RegisterParams> {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(RegisterParams params) async {
    return await repository.register(params.email, params.username, params.password);
  }
}

class RegisterParams {
  final String email;
  final String username;
  final String password;

  RegisterParams({required this.email, required this.username, required this.password});
}
