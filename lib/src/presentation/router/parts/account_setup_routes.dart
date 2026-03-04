part of '../app_router.dart';

List<GoRoute> _accountSetupRoutes() {
  return [
    GoRoute(
      path: AppRoutes.addPersonalInfoScreen,
      name: AppRoutes.addPersonalInfoScreen,
      pageBuilder: (context, state) =>
          MaterialPage(child: const AddPersonalInfoScreen()),
      routes: [
        GoRoute(
          path: AppRoutes.homeAddressScreen,
          name: AppRoutes.homeAddressScreen,
          pageBuilder: (context, state) => MaterialPage(
            child: HomeAddressScreen(
              personalInfo: state.extra as Map<String, dynamic>,
            ),
          ),
          routes: [
            GoRoute(
              path: AppRoutes.countryResidenceScreen,
              name: AppRoutes.countryResidenceScreen,
              pageBuilder: (context, state) => MaterialPage(
                child: CountryResidenceScreen(
                  personalAndAddressInfo: state.extra as Map<String, dynamic>,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ];
}
