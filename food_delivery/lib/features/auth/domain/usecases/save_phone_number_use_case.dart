import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class SavePhoneNumberUseCase {
  final AuthRepository repository;

  SavePhoneNumberUseCase(this.repository);

  Future<void> call(String phone) {
    return repository.savePhoneNumber(phone);
  }
}
