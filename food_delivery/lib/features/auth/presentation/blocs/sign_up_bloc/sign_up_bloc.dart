import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_in_with_google_case.dart';
import 'package:food_delivery/features/auth/domain/usecases/sign_up_use_case.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';
import 'package:food_delivery/shared/utils/firebase_error_mapper.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  late final SignUpUseCase signUpUseCase;
  late final SignInWithGoogleUseCase signInWithGoogleUseCase;

  SignUpBloc() : super(SignUpInitial()) {
    final firebase = FirebaseAuthService();
    final hive = HiveUserService();
    final repo = AuthRepositoryImpl(firebase, hive);

    signUpUseCase = SignUpUseCase(repo);
    signInWithGoogleUseCase = SignInWithGoogleUseCase(repo);

    on<SignUpSubmitted>((event, emit) async {
      emit(SignUpLoading());

      try {
        final user = await signUpUseCase(
          event.email,
          event.password,
          event.name,
        );
        if (user != null) {
          emit(SignUpSuccess(user));
        } else {
          emit(SignUpFailure("Kayıt başarısız."));
        }
      } catch (e) {
        emit(SignUpFailure(e.toString()));
      }
    });

    on<SignInWithGooglePressed>((event, emit) async {
      emit(SignUpLoading());
      try {
        final user = await signInWithGoogleUseCase();
        emit(SignUpSuccess(user, fromGoogle: true));
      } catch (e) {
        final message = FirebaseErrorMapper.map(e);
        emit(SignUpFailure(message));
      }
    });
  }
}
