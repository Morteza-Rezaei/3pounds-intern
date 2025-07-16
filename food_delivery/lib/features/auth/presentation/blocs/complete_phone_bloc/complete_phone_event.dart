part of 'complete_phone_bloc.dart';

abstract class CompletePhoneEvent {}

class PhoneSubmitted extends CompletePhoneEvent {
  final String phone;

  PhoneSubmitted(this.phone);
}
