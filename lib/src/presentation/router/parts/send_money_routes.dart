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
          MaterialPage(child: ChooseRecipientPage()),
      routes: [
        GoRoute(
          path: AppRoutes.sendSelectPurpose,
          name: AppRoutes.sendSelectPurpose,
          pageBuilder: (context, state) => MaterialPage(
            child: SelectPurposeForSendMoneyPage(
              email: (state.extra as Map<String, dynamic>? ??{})["email"] ?? "",
            ),
          ),
          routes: [
            GoRoute(
              path: AppRoutes.sendEnterAmount,
              name: AppRoutes.sendEnterAmount,
              pageBuilder: (context, state) {
                final data = state.extra as Map<String, dynamic>? ??{};
                return MaterialPage(
                  child: EnterAmountForSendMoneyPage(
                    email: data["email"] ?? "",
                    purpose: data["purpose"] ?? "",
                  ),
                );
              },
              routes: [
                GoRoute(
                  path: AppRoutes.sendEnterPin,
                  name: AppRoutes.sendEnterPin,
                  pageBuilder: (context, state) {
                    final data = state.extra as Map<String, dynamic>? ??{};
                    return MaterialPage(
                      child: EnterPinForSendMoneyPage(
                        email: data["email"] ?? "",
                        purpose: data["purpose"] ?? "",
                        amount: (data["amount"] as num?) ?? 0,
                      ),
                    );
                  },
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
