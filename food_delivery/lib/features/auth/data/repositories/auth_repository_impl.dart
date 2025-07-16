import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuthService firebaseService;
  final HiveUserService? hiveService;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  AuthRepositoryImpl(this.firebaseService, [this.hiveService]);

  @override
  Future<UserEntity> signIn(String email, String password) async {
    final user = await firebaseService.signInWithEmailAndPassword(
      email,
      password,
    );
    if (user != null) {
      await hiveService?.saveUserId(user.uid);

      return UserEntity(uid: user.uid);
    } else {
      throw Exception('Login failed');
    }
  }

  @override
  Future<UserEntity> signInWithGoogle() async {
    final user = await firebaseService.signInWithGoogle();
    if (user != null) {
      final userRef = firestore.collection('users').doc(user.uid);
      final doc = await userRef.get();
      if (!doc.exists) {
        final userEntity = UserEntity(
          uid: user.uid,
          email: user.email!,
          name: user.displayName,
        );

        await userRef.set(userEntity.toMap());
      }

      await hiveService?.saveUserId(user.uid);

      return UserEntity(
        uid: user.uid,
        email: user.email,
        name: user.displayName,
      );
    } else {
      throw Exception("Google sign-in failed");
    }
  }

  @override
  Future<UserEntity?> signUp(
    String email,
    String password,
    String? name,
  ) async {
    final user = await firebaseService.signUpWithEmailAndPassword(
      email,
      password,
    );
    if (user == null) return null;

    await firebaseService.sendEmailVerification(user);

    final userEntity = UserEntity(
      uid: user.uid,
      email: user.email!,
      name: name,
    );

    await firestore.collection('users').doc(user.uid).set(userEntity.toMap());
    await hiveService?.saveUserId(user.uid);
    return userEntity;
  }

  @override
  Future<bool> isEmailVerified() {
    return firebaseService.isEmailVerified();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) {
    return firebaseService.sendPasswordResetEmail(email);
  }

  @override
  Future<bool> hasCompletedProfile(String uid) async {
    final doc = await firestore.collection('users').doc(uid).get();

    if (!doc.exists) return false;

    final data = doc.data();
    return data?['phoneNumber'] != null && data?['address'] != null;
  }

  @override
  Future<void> savePhoneNumber(String phone) async {
    final uid = firebaseAuth.currentUser?.uid;
    if (uid == null) throw Exception("Kullanıcı bulunamadı");

    await firestore.collection('users').doc(uid).update({'phoneNumber': phone});
  }

  @override
  Future<void> saveAddress(Map<String, dynamic> address) async {
    final uid = firebaseAuth.currentUser?.uid;
    if (uid == null) throw Exception("Kullanıcı bulunamadı");

    await firestore.collection('users').doc(uid).update({'address': address});
  }

  @override
  Future<void> signOut() async {
    await firebaseService.signOut();
    await hiveService?.clearUserId();
    await hiveService?.clearFirstOpen();
  }
}
