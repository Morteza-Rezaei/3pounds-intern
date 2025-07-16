import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class SaveAddressUseCase {
  final AuthRepository repository;

  SaveAddressUseCase(this.repository);

  Future<void> call(Map<String, dynamic> address) {
    return repository.saveAddress(address);
  }
}
