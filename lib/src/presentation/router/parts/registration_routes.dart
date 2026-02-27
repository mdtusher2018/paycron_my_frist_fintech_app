part of '../app_router.dart';

List<GoRoute> _registrationRoutes() {
  return [
    GoRoute(
      path: AppRoutes.createAccountIntroScreen,
      name: AppRoutes.createAccountIntroScreen,
      builder: (context, state) => const CreateAccountIntroScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.createAccountScreen,
          name: AppRoutes.createAccountScreen,
          builder: (context, state) => const CreateAccountScreen(),
          routes: [
            GoRoute(
              path: AppRoutes.confirmPhoneScreen,
              name: AppRoutes.confirmPhoneScreen,
              pageBuilder: (context, state) => MaterialPage(
                key: state.pageKey,
                child: const ConfirmPhoneScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ];
}
