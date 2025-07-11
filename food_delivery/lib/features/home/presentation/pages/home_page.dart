import 'package:flutter/material.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_out_use_case.dart';
import 'package:go_router/go_router.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        actions: [
          IconButton(
            onPressed: () async {
              final firebase = FirebaseAuthService();
              final hive = HiveUserService();
              final repo = AuthRepositoryImpl(firebase, hive);
              final signOutUseCase = SignOutUseCase(repo);
              await signOutUseCase();
              context.go('/splash'); // çıkış sonrası splash'e yönlen
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: FutureBuilder<String?>(
        future: HiveUserService().getUserId(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return Center(child: Text("Hoşgeldin UID: ${snapshot.data}"));
        },
      ),
    );
  }
}
