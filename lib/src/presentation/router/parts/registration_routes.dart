part of '../app_router.dart';

List<GoRoute> _registrationRoutes() {
  return [
    GoRoute(
      path: AppRoutes.createAccountIntroScreen,
      name: AppRoutes.createAccountIntroScreen,
      pageBuilder: (context, state) =>
          MaterialPage(child: const CreateAccountIntroScreen()),
      routes: [
        GoRoute(
          path: AppRoutes.createAccountScreen,
          name: AppRoutes.createAccountScreen,
          pageBuilder: (context, state) =>
              MaterialPage(child: const CreateAccountScreen()),
          routes: [
            GoRoute(
              path: AppRoutes.confirmPhoneScreen,
              name: AppRoutes.confirmPhoneScreen,
              pageBuilder: (context, state) =>
                  MaterialPage(child: const ConfirmPhoneScreen()),
            ),
          ],
        ),
      ],
    ),
  ];
}
