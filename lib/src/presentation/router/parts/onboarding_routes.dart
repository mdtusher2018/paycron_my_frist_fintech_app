part of '../app_router.dart';

List<GoRoute> _onboardingRoutes() {
  return [
    GoRoute(
      path: AppRoutes.onboardingScreen,
      name: AppRoutes.onboardingScreen,
      pageBuilder: (context, state) =>
          MaterialPage(child: const OnboardingScreen()),
    ),
  ];
}
