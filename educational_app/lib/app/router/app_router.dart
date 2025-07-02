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
  ],
);
