import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // Initializes the BLoC with default state and registers event handlers.
  SignInBloc() : super(const SignInState()) {
    on<EmailEvent>(_onEmailChanged); // Handles email input changes.
    on<PasswordEvent>(_onPasswordChanged);
  }

  // Updates the state with the new email.
  void _onEmailChanged(EmailEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  // Updates the state with the new password.
  void _onPasswordChanged(PasswordEvent event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
