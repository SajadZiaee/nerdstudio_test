import 'package:nerd_test/features/auth/domain/repositories/auth_repository.dart';

class GetAccessTokenUseCase {
  final AuthRepository authRepository;

  GetAccessTokenUseCase(this.authRepository);

  Future<String?> call() async {
    return await authRepository.getAccessToken();
  }
}
