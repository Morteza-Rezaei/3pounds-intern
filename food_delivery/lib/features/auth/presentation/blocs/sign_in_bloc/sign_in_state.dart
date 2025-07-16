part of 'sign_in_bloc.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final UserEntity user;
  SignInSuccess(this.user);
}

class SignInNeedsProfileCompletion extends SignInState {
  final UserEntity user;

  SignInNeedsProfileCompletion(this.user);
}

class SignInError extends SignInState {
  final String message;
  SignInError(this.message);
}
