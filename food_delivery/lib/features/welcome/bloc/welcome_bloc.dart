import 'package:flutter_bloc/flutter_bloc.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<PageChangedEvent>((event, emit) {
      emit(WelcomeState(pageIndex: event.pageIndex));
    });
  }
}
