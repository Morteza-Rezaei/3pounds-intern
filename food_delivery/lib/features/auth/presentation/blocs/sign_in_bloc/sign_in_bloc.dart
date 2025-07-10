import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/utils/firebase_error_mapper.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/datasources/hive_user_service.dart';
import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late final SignInUseCase signInUseCase;

  SignInBloc() : super(SignInInitial()) {
    final firebase = FirebaseAuthService();
    final hive = HiveUserService();
    final repo = AuthRepositoryImpl(firebase, hive);
    signInUseCase = SignInUseCase(repo);

    on<SignInRequested>((event, emit) async {
      emit(SignInLoading());
      try {
        final user = await signInUseCase(event.email, event.password);
        emit(SignInSuccess(user));
      } catch (e) {
        final message = FirebaseErrorMapper.map(e);
        emit(SignInError(message));
      }
    });
  }
}
