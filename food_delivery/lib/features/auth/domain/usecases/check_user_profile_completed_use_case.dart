import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class CheckUserProfileCompletedUseCase {
  final AuthRepository repository;

  CheckUserProfileCompletedUseCase(this.repository);

  Future<bool> call(String uid) {
    return repository.hasCompletedProfile(uid);
  }
}
