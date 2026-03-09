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
          pageBuilder: (context, state) => MaterialPage(
            child: SelectPurposeForRequestMoneyPage(
              email:
                  (state.extra as Map<String, dynamic>? ?? {})["email"] ?? "",
            ),
          ),
          routes: [
            GoRoute(
              path: AppRoutes.receiveEnterAmount,
              name: AppRoutes.receiveEnterAmount,
              pageBuilder: (context, state) {
                final data = state.extra as Map<String, dynamic>? ?? {};
                return MaterialPage(
                  child: EnterAmountForRequestMoneyPage(
                    email: data["email"] ?? "",
                    purpose: data["purpose"] ?? "",
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: AppRoutes.receiveEnterPin,
                  name: AppRoutes.receiveEnterPin,
                  pageBuilder: (context, state) {
                    final data = state.extra as Map<String, dynamic>? ?? {};
                    return MaterialPage(
                      child: EnterPinForRequestMoneyPage(
                        email: data["email"] ?? "",
                        purpose: data["purpose"] ?? "",
                        amount: (data["amount"] as num?) ?? 0,
                      ),
                    );
                  },
                ),
                GoRoute(
                  path: AppRoutes.receiveComplete,
                  name: AppRoutes.receiveComplete,
                  pageBuilder: (context, state) {
                    return const MaterialPage(
                      child: ReceiveRequestSuccessPage(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}
