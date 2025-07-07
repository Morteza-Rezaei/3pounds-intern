import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get appBlocProviders => [
    /// Returns a list of all BlocProviders used throughout the app.
    //BlocProvider(create: (context) => WelcomeBloc()),
  ];
}
