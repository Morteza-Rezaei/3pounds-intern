import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/presentation/blocs/complete_address_bloc/complete_address_bloc.dart';
import 'package:food_delivery/features/auth/presentation/blocs/complete_phone_bloc/complete_phone_bloc.dart';
import 'package:food_delivery/features/auth/presentation/blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:food_delivery/features/auth/presentation/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:food_delivery/features/auth/presentation/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:food_delivery/features/auth/presentation/pages/complete_address_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/complete_phone_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/forgot_password_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/sign_in_page.dart';
import 'package:food_delivery/features/auth/presentation/pages/sign_up_page.dart';
import 'package:food_delivery/features/foods/presentation/pages/foods_page.dart';
import 'package:food_delivery/features/home/presentation/pages/home_page.dart';
import 'package:food_delivery/features/search/presentation/pages/search_page.dart';
import 'package:food_delivery/features/splash/presentation/page/splash_page.dart';
import 'package:food_delivery/features/welcome/presentation/bloc/welcome_bloc.dart';
import 'package:food_delivery/features/welcome/presentation/page/welcome_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => BlocProvider(
        create: (context) => WelcomeBloc(),
        child: const WelcomePage(),
      ),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => BlocProvider(
        create: (context) => SignInBloc(),
        child: const SignInPage(),
      ),
    ),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: const ForgotPasswordPage(),
      ),
    ),
    GoRoute(
      path: '/sign-up',
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpBloc(),
        child: const SignUpPage(),
      ),
    ),
    GoRoute(
      path: '/complete-phone',
      builder: (context, state) => BlocProvider(
        create: (context) => CompletePhoneBloc(),
        child: CompletePhonePage(),
      ),
    ),
    GoRoute(
      path: '/complete-address',
      builder: (context, state) => BlocProvider(
        create: (context) => CompleteAddressBloc(),
        child: CompleteAddressPage(),
      ),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) {
        final keyword = state.uri.queryParameters['keyword'] ?? '';
        return SearchPage(searchTerm: keyword);
      },
    ),

    GoRoute(
      path: '/foods',
      builder: (context, state) {
        final category = state.extra as String?;
        return FoodsPage(initialCategory: category);
      },
    ),
  ],
);
