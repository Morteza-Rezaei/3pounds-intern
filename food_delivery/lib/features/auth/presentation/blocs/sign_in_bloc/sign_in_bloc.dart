import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/domain/usecases/check_email_verified_use_case.dart';
import 'package:food_delivery/features/auth/domain/usecases/check_user_profile_completed_use_case.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_in_with_google_case.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';
import 'package:food_delivery/shared/utils/firebase_error_mapper.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';

import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_in_use_case.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  late final SignInUseCase signInUseCase;
  late final SignInWithGoogleUseCase signInWithGoogleUseCase;
  late final CheckEmailVerifiedUseCase checkEmailVerifiedUseCase;
  late final CheckUserProfileCompletedUseCase checkUserProfileCompletedUseCase;

  SignInBloc() : super(SignInInitial()) {
    final firebase = FirebaseAuthService();
    final hive = HiveUserService();
    final repo = AuthRepositoryImpl(firebase, hive);

    signInUseCase = SignInUseCase(repo);
    signInWithGoogleUseCase = SignInWithGoogleUseCase(repo);
    checkEmailVerifiedUseCase = CheckEmailVerifiedUseCase(repo);
    checkUserProfileCompletedUseCase = CheckUserProfileCompletedUseCase(repo);

    on<SignInRequested>((event, emit) async {
      emit(SignInLoading());
      try {
        final user = await signInUseCase(event.email, event.password);

        final isVerified = await checkEmailVerifiedUseCase();
        if (!isVerified) {
          emit(SignInError('Email not verified. Please check your inbox.'));
          return;
        }

        final isCompleted = await checkUserProfileCompletedUseCase(user.uid);

        if (isCompleted) {
          emit(SignInSuccess(user));
        } else {
          emit(SignInNeedsProfileCompletion(user));
        }
      } catch (e) {
        final message = FirebaseErrorMapper.map(e);
        emit(SignInError(message));
      }
    });

    on<SignInWithGooglePressed>((event, emit) async {
      emit(SignInLoading());
      try {
        final user = await signInWithGoogleUseCase();
        emit(SignInSuccess(user));
      } catch (e) {
        final message = FirebaseErrorMapper.map(e);
        emit(SignInError(message));
      }
    });
  }
}
