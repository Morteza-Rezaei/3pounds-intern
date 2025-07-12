import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';

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
      await hiveService.saveUserId(user.uid);
      return UserEntity(uid: user.uid);
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    final user = await firebaseService.signInWithGoogle();
    if (user != null) {
      await hiveService.saveUserId(user.uid);

      return UserEntity(uid: user.uid);
    } else {
      throw Exception("Google ile giriş başarısız");
    }
  }

  @override
  Future<void> signOut() async {
    await firebaseService.signOut();
    await hiveService.clearUserId();
    await hiveService.clearFirstOpen();
  }
}
