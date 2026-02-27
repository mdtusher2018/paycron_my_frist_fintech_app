part of '../app_router.dart';

List<GoRoute> _onboardingRoutes() {
  return [
    GoRoute(
      path: AppRoutes.onboardingScreen,
      name: AppRoutes.onboardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
  ];
}
