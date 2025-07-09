part of 'forgot_password_bloc.dart';

class ForgotPasswordState {
  // The user's email input.
  final String email;

  // Constructor with an optional email parameter.
  const ForgotPasswordState({this.email = ''});

  // Creates a new ForgotPasswordState with updated values.
  ForgotPasswordState copyWith({String? email}) {
    return ForgotPasswordState(email: email ?? this.email);
  }
}
