import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/data/datasources/firebase_auth_service.dart';
import 'package:food_delivery/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_delivery/features/auth/domain/usecases/save_address_use_case.dart';
import 'package:food_delivery/shared/utils/firebase_error_mapper.dart';

part 'complete_address_event.dart';
part 'complete_address_state.dart';

class CompleteAddressBloc
    extends Bloc<CompleteAddressEvent, CompleteAddressState> {
  late final SaveAddressUseCase saveAddressUseCase;

  CompleteAddressBloc() : super(CompleteAddressInitial()) {
    final firebase = FirebaseAuthService();
    final repo = AuthRepositoryImpl(firebase, null);
    saveAddressUseCase = SaveAddressUseCase(repo);

    on<AddressSubmitted>((event, emit) async {
      emit(CompleteAddressLoading());
      try {
        await saveAddressUseCase(event.address);
        emit(CompleteAddressSuccess());
      } catch (e) {
        emit(CompleteAddressFailure(FirebaseErrorMapper.map(e)));
      }
    });
  }
}
