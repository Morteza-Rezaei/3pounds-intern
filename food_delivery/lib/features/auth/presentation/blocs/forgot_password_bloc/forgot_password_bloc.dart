import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/usecases/forgot_password_use_case.dart';
import 'package:food_delivery/shared/utils/firebase_error_mapper.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  late final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordBloc() : super(ForgotPasswordInitial()) {
    final firebase = FirebaseAuthService();
    final repo = AuthRepositoryImpl(firebase, null);
    forgotPasswordUseCase = ForgotPasswordUseCase(repo);

    on<ForgotPasswordSubmitted>(_onSubmitted);
  }

  Future<void> _onSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordLoading());

    try {
      await forgotPasswordUseCase(event.email);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      final error = FirebaseErrorMapper.map(e);
      emit(ForgotPasswordFailure(error));
    }
  }
}
