part of 'complete_address_bloc.dart';

abstract class CompleteAddressEvent {}

class AddressSubmitted extends CompleteAddressEvent {
  final Map<String, dynamic> address;

  AddressSubmitted(this.address);
}
