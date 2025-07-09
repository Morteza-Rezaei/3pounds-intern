import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/features/auth/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:food_delivery/features/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:food_delivery/features/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:food_delivery/features/auth/page/forgot_password_page.dart';
import 'package:food_delivery/features/auth/page/reset_link_page.dart';
import 'package:food_delivery/features/auth/page/sign_in_page.dart';
import 'package:food_delivery/features/auth/page/sign_phone_number_page.dart';
import 'package:food_delivery/features/auth/page/sign_up_page.dart';
import 'package:food_delivery/features/auth/page/verify_phone_number.dart';
import 'package:food_delivery/features/splash/page/splash_page.dart';
import 'package:food_delivery/features/welcome/bloc/welcome_bloc.dart';
import 'package:food_delivery/features/welcome/page/welcome_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashPage()),
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
    ShellRoute(
      builder: (context, state, child) =>
          BlocProvider(create: (context) => ForgotPasswordBloc(), child: child),
      routes: [
        GoRoute(
          path: '/forgot-password',
          builder: (context, state) => const ForgotPasswordPage(),
        ),
        GoRoute(
          path: '/reset-link',
          builder: (context, state) => const ResetLinkPage(),
        ),
      ],
    ),
    ShellRoute(
      builder: (context, state, child) =>
          BlocProvider(create: (context) => SignUpBloc(), child: child),
      routes: [
        GoRoute(
          path: '/sign-up',
          builder: (context, state) => const SignUpPage(),
        ),
        GoRoute(
          path: '/sign-phone-number',
          builder: (context, state) => const SignPhoneNumberPage(),
        ),
        GoRoute(
          path: '/verify-phone-number',
          builder: (context, state) => const VerifyPhoneNumber(),
        ),
      ],
    ),
  ],
);
