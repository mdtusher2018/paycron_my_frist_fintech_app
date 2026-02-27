part of '../app_router.dart';

List<GoRoute> _accountVerificationRoutes() {
  return [
    GoRoute(
      path: AppRoutes.accountSetupProgressScreen,
      name: AppRoutes.accountSetupProgressScreen,
      builder: (context, state) => const AccountSetupProgressScreen(),
    ),
    GoRoute(
      path: AppRoutes.takeSelfieInstructionScreen,
      name: AppRoutes.takeSelfieInstructionScreen,
      builder: (context, state) => const TakeSelfieInstructionScreen(),
    ),
    GoRoute(
      path: AppRoutes.selfieCameraScreen,
      name: AppRoutes.selfieCameraScreen,
      builder: (context, state) => const SelfieCameraScreen(),
    ),
    GoRoute(
      path: AppRoutes.idVerificationProgressScreen,
      name: AppRoutes.idVerificationProgressScreen,
      builder: (context, state) => const IdVerificationProgressScreen(),
    ),
    GoRoute(
      path: AppRoutes.scanIdScreen,
      name: AppRoutes.scanIdScreen,
      builder: (context, state) => const ScanIdScreen(),
    ),
  ];
}
