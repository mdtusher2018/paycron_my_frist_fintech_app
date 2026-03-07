part of '../app_router.dart';

List<GoRoute> _sendMoneyRoutes() {
  return [
    GoRoute(
      path: AppRoutes.sendScanQr,
      name: AppRoutes.sendScanQr,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ScanQrForSendPage()),
    ),
    GoRoute(
      path: AppRoutes.sendChooseRecipient,
      name: AppRoutes.sendChooseRecipient,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ChooseRecipientPage()),
      routes: [
        GoRoute(
          path: AppRoutes.sendSelectPurpose,
          name: AppRoutes.sendSelectPurpose,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SelectPurposeForSendMoneyPage()),
          routes: [
            GoRoute(
              path: AppRoutes.sendEnterAmount,
              name: AppRoutes.sendEnterAmount,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: EnterAmountForSendMoneyPage()),
              routes: [
                GoRoute(
                  path: AppRoutes.sendEnterPin,
                  name: AppRoutes.sendEnterPin,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: EnterPinForSendMoneyPage()),
                ),
                GoRoute(
                  path: AppRoutes.sendComplete,
                  name: AppRoutes.sendComplete,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: SendTransactionCompletePage()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
