part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

// Triggered when the user updates the username field.
class UsernameEvent extends SignUpEvent {
  final String username;

  const UsernameEvent(this.username);
}

// Triggered when the user updates the email field.
class EmailEvent extends SignUpEvent {
  final String email;

  const EmailEvent(this.email);
}

// Triggered when the user updates the password field.
class PasswordEvent extends SignUpEvent {
  final String password;

  const PasswordEvent(this.password);
}

// Triggered when the user updates the telephone number field.
class PhoneNumberEvent extends SignUpEvent {
  final String telephone;

  const PhoneNumberEvent(this.telephone);
}
