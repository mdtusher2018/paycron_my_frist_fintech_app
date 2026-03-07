part of '../app_router.dart';

List<GoRoute> _receiveMoneyRoutes() {
  return [
    GoRoute(
      path: AppRoutes.receiveChooseRecipient,
      name: AppRoutes.receiveChooseRecipient,
      pageBuilder: (context, state) =>
          const MaterialPage(child: ChooseSenderPage()),
      routes: [
        GoRoute(
          path: AppRoutes.receiveScanQr,
          name: AppRoutes.receiveScanQr,
          pageBuilder: (context, state) =>
              const MaterialPage(child: ScanQrForRequestMoneyPage()),
        ),
        GoRoute(
          path: AppRoutes.receiveSelectPurpose,
          name: AppRoutes.receiveSelectPurpose,
          pageBuilder: (context, state) =>
              const MaterialPage(child: SelectPurposeForRequestMoneyPage()),
          routes: [
            GoRoute(
              path: AppRoutes.receiveEnterAmount,
              name: AppRoutes.receiveEnterAmount,
              pageBuilder: (context, state) =>
                  const MaterialPage(child: EnterAmountForRequestMoneyPage()),
              routes: [
                GoRoute(
                  path: AppRoutes.receiveEnterPin,
                  name: AppRoutes.receiveEnterPin,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: EnterPinForRequestMoneyPage()),
                ),
                GoRoute(
                  path: AppRoutes.receiveComplete,
                  name: AppRoutes.receiveComplete,
                  pageBuilder: (context, state) =>
                      const MaterialPage(child: ReceiveRequestSuccessPage()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
