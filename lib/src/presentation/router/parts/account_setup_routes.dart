part of '../app_router.dart';

List<GoRoute> _accountSetupRoutes() {
  return [
    GoRoute(
      path: AppRoutes.addEmailScreen,
      name: AppRoutes.addEmailScreen,
      builder: (context, state) => const AddEmailScreen(),
      routes: [
        GoRoute(
          path: AppRoutes.homeAddressScreen,
          name: AppRoutes.homeAddressScreen,
          builder: (context, state) => const HomeAddressScreen(),
          routes: [
            GoRoute(
              path: AppRoutes.addPersonalInfoScreen,
              name: AppRoutes.addPersonalInfoScreen,
              builder: (context, state) => const AddPersonalInfoScreen(),
              routes: [
                GoRoute(
                  path: AppRoutes.countryResidenceScreen,
                  name: AppRoutes.countryResidenceScreen,
                  builder: (context, state) => const CountryResidenceScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
