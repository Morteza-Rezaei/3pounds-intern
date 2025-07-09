part of 'sign_in_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

// Triggered when the user updates the email field.
class EmailEvent extends SignInEvent {
  final String email;

  const EmailEvent(this.email);
}

// Triggered when the user updates the password field.
class PasswordEvent extends SignInEvent {
  final String password;

  const PasswordEvent(this.password);
}
