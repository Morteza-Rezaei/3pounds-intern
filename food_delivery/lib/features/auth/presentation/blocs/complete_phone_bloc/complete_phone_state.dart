part of 'complete_phone_bloc.dart';

abstract class CompletePhoneState {}

class CompletePhoneInitial extends CompletePhoneState {}

class CompletePhoneLoading extends CompletePhoneState {}

class CompletePhoneSuccess extends CompletePhoneState {}

class CompletePhoneFailure extends CompletePhoneState {
  final String message;

  CompletePhoneFailure(this.message);
}
