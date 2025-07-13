import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class CheckEmailVerifiedUseCase {
  final AuthRepository _authRepository;

  CheckEmailVerifiedUseCase(this._authRepository);

  Future<bool> call() async {
    return await _authRepository.isEmailVerified();
  }
}
