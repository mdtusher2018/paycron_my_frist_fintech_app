part of '../app_router.dart';

List<GoRoute> _sendMoneyRoutes() {
  return [
    GoRoute(
      path: AppRoutes.scanQrPayScreen,
      name: AppRoutes.scanQrPayScreen,
      pageBuilder: (context, state) => const MaterialPage(child: ScanQrPage()),
    ),
    GoRoute(
      path: AppRoutes.chooseRecipientScreen,
      name: AppRoutes.chooseRecipientScreen,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ChooseRecipientPage()),
      routes: [
        GoRoute(
          path: AppRoutes.selectPurposeScreen,
          name: AppRoutes.selectPurposeScreen,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SelectPurposePage()),
          routes: [
            GoRoute(
              path: AppRoutes.enterAmountScreen,
              name: AppRoutes.enterAmountScreen,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: EnterAmountPage()),
              routes: [
                GoRoute(
                  path: AppRoutes.transactionCompletePage,
                  name: AppRoutes.transactionCompletePage,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: TransactionCompletePage()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
