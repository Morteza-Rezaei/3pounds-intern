import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/datasources/hive_user_service.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseService;
  final HiveUserService hiveService;

  AuthRepositoryImpl(this.firebaseService, this.hiveService);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final user = await firebaseService.signInWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      await hiveService.saveUserEmail(user.email ?? '');
      return UserEntity(email: user.email ?? '');
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseService.signOut();
    await hiveService.clearUser();
  }
}
