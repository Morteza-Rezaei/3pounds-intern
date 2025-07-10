part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class SignInRequested extends SignInEvent {
  final String email;
  final String password;

  SignInRequested({required this.email, required this.password});
}
