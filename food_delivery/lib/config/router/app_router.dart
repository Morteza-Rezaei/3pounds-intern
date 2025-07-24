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
import 'package:food_delivery/features/checkout/presentation/pages/add_card_page.dart';
import 'package:food_delivery/features/checkout/presentation/pages/cart_page.dart';
import 'package:food_delivery/features/checkout/presentation/pages/payment_method_page.dart';
import 'package:food_delivery/features/checkout/presentation/pages/success_message_page.dart';
import 'package:food_delivery/features/foods/presentation/pages/foods_page.dart';
import 'package:food_delivery/features/home/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'package:food_delivery/features/home/presentation/blocs/categories_bloc/categories_event.dart';
import 'package:food_delivery/features/home/presentation/blocs/meals_bloc/meals_bloc.dart';
import 'package:food_delivery/features/home/presentation/blocs/meals_bloc/meals_event.dart';
import 'package:food_delivery/features/home/presentation/pages/home_page.dart';
import 'package:food_delivery/features/meal_detail/presentation/pages/meal_detail_page.dart';
import 'package:food_delivery/features/meal_detail/presentation/pages/restaurant_detail_page.dart';
import 'package:food_delivery/features/search/presentation/pages/search_page.dart';
import 'package:food_delivery/features/splash/presentation/page/splash_page.dart';
import 'package:food_delivery/features/tracking/presentation/pages/my_orders_page.dart';
import 'package:food_delivery/features/tracking/presentation/pages/track__map_page.dart';
import 'package:food_delivery/features/tracking/presentation/pages/track_order_page.dart';
import 'package:food_delivery/features/welcome/presentation/bloc/welcome_bloc.dart';
import 'package:food_delivery/features/welcome/presentation/page/welcome_page.dart';
import 'package:food_delivery/shared/models/meal_entity.dart';
import 'package:food_delivery/shared/models/restaurant_entity.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(path: '/', builder: (context, state) => const SplashPage()),
    GoRoute(
      path: '/home',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CategoriesBloc()..add(FetchCategories())),
          BlocProvider(create: (_) => MealsBloc()),
        ],
        child: const HomePage(),
      ),
    ),

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
        return BlocProvider(
          create: (_) => MealsBloc()..add(FetchMealsByCategory(category ?? '')),
          child: FoodsPage(initialCategory: category),
        );
      },
    ),

    GoRoute(
      path: '/meal-detail',
      builder: (context, state) {
        final meal = state.extra as MealEntity;
        return MealDetailPage(meal: meal);
      },
    ),
    GoRoute(
      path: '/restaurant-detail',
      builder: (context, state) {
        final restaurant = state.extra as RestaurantEntity;
        return BlocProvider(
          create: (_) => MealsBloc(),
          child: RestaurantDetailPage(restaurant: restaurant),
        );
      },
    ),

    GoRoute(path: '/cart', builder: (context, state) => const CartPage()),
    GoRoute(
      path: '/payment-method',
      builder: (context, state) => const PaymentMethodPage(),
    ),
    GoRoute(
      path: '/add-card',
      builder: (context, state) => const AddCardPage(),
    ),
    GoRoute(
      path: '/success-message',
      builder: (context, state) => const SuccessMessagePage(),
    ),
    GoRoute(
      path: '/my-orders',
      builder: (context, state) => const MyOrdersPage(),
    ),
    GoRoute(
      path: '/track-order',
      builder: (context, state) => const TrackOrderPage(),
    ),
    GoRoute(
      path: '/track-map',
      builder: (context, state) => const TrackMapPage(),
    ),
  ],
);
