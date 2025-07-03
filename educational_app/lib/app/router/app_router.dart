import 'package:educational_app/features/auth/confirm_email_screen.dart';
import 'package:educational_app/features/auth/reset_password_screen.dart';
import 'package:educational_app/features/auth/login_screen.dart';
import 'package:educational_app/features/auth/signup_screen.dart';
import 'package:educational_app/features/home/home_screen.dart';
import 'package:educational_app/features/landing/landing_screen.dart';
import 'package:educational_app/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/splash',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/home', builder: (context, state) => const HomeScreen()),
    GoRoute(
      path: '/landing',
      builder: (context, state) => const LandingScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupScreen()),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    GoRoute(
      path: '/confirm-email',
      builder: (context, state) => const ConfirmEmailScreen(),
    ),
  ],
);
