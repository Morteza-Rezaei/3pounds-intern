import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/usecases/save_phone_number_use_case.dart';
import 'package:food_delivery/shared/utils/firebase_error_mapper.dart';

part 'complete_phone_event.dart';
part 'complete_phone_state.dart';

class CompletePhoneBloc extends Bloc<CompletePhoneEvent, CompletePhoneState> {
  late final SavePhoneNumberUseCase savePhoneNumberUseCase;

  CompletePhoneBloc() : super(CompletePhoneInitial()) {
    final firebase = FirebaseAuthService();
    final repo = AuthRepositoryImpl(firebase, null);
    savePhoneNumberUseCase = SavePhoneNumberUseCase(repo);

    on<PhoneSubmitted>((event, emit) async {
      emit(CompletePhoneLoading());
      try {
        await savePhoneNumberUseCase(event.phone);
        emit(CompletePhoneSuccess());
      } catch (e) {
        final message = FirebaseErrorMapper.map(e);
        emit(CompletePhoneFailure(message));
      }
    });
  }
}
