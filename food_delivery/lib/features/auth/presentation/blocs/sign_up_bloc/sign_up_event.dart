part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpSubmitted extends SignUpEvent {
  final String email;
  final String password;
  final String? name;

  const SignUpSubmitted({
    required this.email,
    required this.password,
    this.name,
  });
}

class SignInWithGooglePressed extends SignUpEvent {}
