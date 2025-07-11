import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/shared/services/hive_user_service.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<PageChangedEvent>((event, emit) {
      emit(WelcomeState(pageIndex: event.pageIndex));
    });

    on<MarkFirstOpenEvent>((event, emit) async {
      await HiveUserService().setFirstOpen();
    });
  }
}
