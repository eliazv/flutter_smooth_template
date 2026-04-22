import 'package:flutter_smooth_template/core/config/feature_flags.dart';
import 'package:flutter_smooth_template/features/home/presentation/home_screen.dart';
import 'package:flutter_smooth_template/features/onboarding/presentation/onboarding_screen.dart';
import 'package:flutter_smooth_template/features/paywall/presentation/paywall_screen.dart';
import 'package:go_router/go_router.dart';

GoRouter buildAppRouter(FeatureFlags flags) {
  final initialLocation = flags.enableOnboarding ? '/onboarding' : '/home';

  return GoRouter(
    initialLocation: initialLocation,
    routes: <RouteBase>[
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: 'onboarding',
        builder: (context, state) {
          if (!flags.enableOnboarding) {
            return const HomeScreen();
          }
          return const OnboardingScreen();
        },
      ),
      GoRoute(
        path: '/paywall',
        name: 'paywall',
        builder: (context, state) {
          if (!flags.enablePaywall) {
            return const HomeScreen();
          }
          return const PaywallScreen();
        },
      ),
    ],
  );
}
