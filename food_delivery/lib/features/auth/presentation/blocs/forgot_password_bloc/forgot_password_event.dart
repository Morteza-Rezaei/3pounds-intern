part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent {
  const ForgotPasswordEvent();
}

// Triggered when the user updates the email field.
class EmailEvent extends ForgotPasswordEvent {
  final String email;

  const EmailEvent(this.email);
}
