part of '../app_router.dart';

List<GoRoute> _accountSetupRoutes() {
  return [
    GoRoute(
      path: AppRoutes.addEmailScreen,
      name: AppRoutes.addEmailScreen,
      pageBuilder: (context, state) =>
          MaterialPage(child: const AddEmailScreen()),
      routes: [
        GoRoute(
          path: AppRoutes.homeAddressScreen,
          name: AppRoutes.homeAddressScreen,
          pageBuilder: (context, state) =>
              MaterialPage(child: const HomeAddressScreen()),
          routes: [
            GoRoute(
              path: AppRoutes.addPersonalInfoScreen,
              name: AppRoutes.addPersonalInfoScreen,
              pageBuilder: (context, state) =>
                  MaterialPage(child: const AddPersonalInfoScreen()),
              routes: [
                GoRoute(
                  path: AppRoutes.countryResidenceScreen,
                  name: AppRoutes.countryResidenceScreen,
                  pageBuilder: (context, state) =>
                      MaterialPage(child: const CountryResidenceScreen()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
