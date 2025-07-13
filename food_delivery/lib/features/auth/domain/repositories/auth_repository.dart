import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn(String email, String password);
  Future<void> signOut();
  Future<UserEntity> signInWithGoogle();
  Future<UserEntity?> signUp(String email, String password, String? name);
  Future<bool> isEmailVerified();
}
