import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<UsernameEvent>(_onUsernameChanged);
    on<EmailEvent>(_onEmailChanged);
    on<PasswordEvent>(_onPasswordChanged);
    on<PhoneNumberEvent>(_onTelephoneInputChanged);
  }
  void _onUsernameChanged(UsernameEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _onEmailChanged(EmailEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordEvent event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onTelephoneInputChanged(
    PhoneNumberEvent event,
    Emitter<SignUpState> emit,
  ) {
    emit(state.copyWith(telephone: event.telephone));
  }
}
