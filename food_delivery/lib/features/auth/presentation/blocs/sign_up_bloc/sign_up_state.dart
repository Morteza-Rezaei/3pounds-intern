part of 'sign_up_bloc.dart';

class SignUpState {
  // The user's username input.
  final String username;
  // The user's email input.
  final String email;
  // The user's password input.
  final String password;
  // The user's telephone number input.
  final String phoneNumber;

  const SignUpState({
    this.username = '',
    this.email = '',
    this.password = '',
    this.phoneNumber = '',
  });

  // Creates a new SignUpState with updated values.
  SignUpState copyWith({
    String? username,
    String? email,
    String? password,
    String? telephone,
  }) {
    return SignUpState(
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: telephone ?? this.phoneNumber,
    );
  }
}
