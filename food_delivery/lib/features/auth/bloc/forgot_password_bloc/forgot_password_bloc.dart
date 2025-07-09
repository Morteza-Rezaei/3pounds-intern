import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  // Initializes the BLoC with default state and registers event handlers.
  ForgotPasswordBloc() : super(const ForgotPasswordState()) {
    on<EmailEvent>(_onEmailChanged); // Handles email input changes.
  }

  // Updates the state with the new email.
  void _onEmailChanged(EmailEvent event, Emitter<ForgotPasswordState> emit) {
    emit(state.copyWith(email: event.email));
  }
}
