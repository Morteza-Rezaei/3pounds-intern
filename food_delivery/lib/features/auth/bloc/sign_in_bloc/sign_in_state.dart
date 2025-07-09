part of 'sign_in_bloc.dart';

class SignInState {
  // The user's email input.
  final String email;
  // The user's password input.
  final String password;
  const SignInState({this.email = '', this.password = ''});

  // Creates a new SignInState with updated values.
  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
