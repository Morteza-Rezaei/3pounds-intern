part of 'complete_address_bloc.dart';

abstract class CompleteAddressState {}

class CompleteAddressInitial extends CompleteAddressState {}

class CompleteAddressLoading extends CompleteAddressState {}

class CompleteAddressSuccess extends CompleteAddressState {}

class CompleteAddressFailure extends CompleteAddressState {
  final String message;

  CompleteAddressFailure(this.message);
}
