import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/bkash/account_verification/AccountSetupProgressScreen.dart';
import 'package:paycron_app/bkash/account_verification/IdVerificationProgressScreen.dart';
import 'package:paycron_app/bkash/account_verification/ScanIdScreen.dart';
import 'package:paycron_app/bkash/account_verification/SelfieCameraScreen.dart';
import 'package:paycron_app/bkash/account_verification/TakeSelfieInstructionScreen.dart';
import 'package:paycron_app/bkash/request/receive_request_success_page.dart';
import 'package:paycron_app/bkash/request/choose_sender_page.dart';
import 'package:paycron_app/bkash/request/enter_amount_page.dart';
import 'package:paycron_app/bkash/request/enter_pin_page.dart';
import 'package:paycron_app/bkash/request/scan_qr_for_request_money_page.dart';
import 'package:paycron_app/bkash/request/select_purpose_page.dart';
import 'package:paycron_app/src/presentation/cards/cards_management_page.dart';
import 'package:paycron_app/src/presentation/features/root_view.dart';
import 'package:paycron_app/src/presentation/features/send/choose_recipient_page.dart';
import 'package:paycron_app/src/presentation/features/send/enter_pin_for_send_money_page.dart';
import 'package:paycron_app/src/presentation/features/send/enter_amount_for_send_money_page.dart';
import 'package:paycron_app/src/presentation/features/send/scan_qr_for_send_money_page.dart';
import 'package:paycron_app/src/presentation/features/send/select_purpose_for_send_money_page.dart';
import 'package:paycron_app/src/presentation/features/send/send_transaction_complete_page.dart';
import 'package:paycron_app/src/presentation/features/authentication/pages/registration/confirm_phone_screen.dart';
import 'package:paycron_app/bkash/on_boarding/create_account_intro_screen.dart';
import 'package:paycron_app/src/presentation/features/authentication/pages/registration/create_account_screen.dart';
import 'package:paycron_app/bkash/on_boarding/onboarding_screen.dart';
import 'package:paycron_app/src/presentation/features/account_setup/add_personal_info_screen.dart';
import 'package:paycron_app/src/presentation/features/account_setup/country_residence_screen.dart';
import 'package:paycron_app/src/presentation/features/account_setup/home_address_screen.dart';
import 'package:paycron_app/src/presentation/features/authentication/pages/signin_page.dart';
import 'package:paycron_app/src/presentation/features/home/add_money_view.dart';

import 'package:paycron_app/src/presentation/features/home/send_money_view.dart';
import 'package:paycron_app/src/presentation/requests/money_requests_page.dart';
import 'routes.dart';

part 'parts/onboarding_routes.dart';
part 'parts/account_setup_routes.dart';
part 'parts/registration_routes.dart';
part 'parts/account_verification_routes.dart';
part 'parts/send_money_routes.dart';
part 'parts/receive_money_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.onboardingScreen,
    routes: [
      ..._onboardingRoutes(),
      ..._registrationRoutes(),
      ..._accountSetupRoutes(),
      ..._accountVerificationRoutes(),
      ..._sendMoneyRoutes(),
      ..._receiveMoneyRoutes(),

      GoRoute(
        path: AppRoutes.signIn,
        name: AppRoutes.signIn,
        builder: (context, state) => SigninPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const RootView(),
      ),

      GoRoute(
        path: AppRoutes.sendMoney,
        name: AppRoutes.sendMoney,
        builder: (context, state) => const SendMoneyPage(),
      ),
      GoRoute(
        path: AppRoutes.addMoney,
        name: AppRoutes.addMoney,
        builder: (context, state) => AddMoneyPage(),
      ),

      GoRoute(
        path: AppRoutes.cardsManagement,
        name: AppRoutes.cardsManagement,
        builder: (context, state) => const CardsManagementPage(),
      ),

      GoRoute(
        path: AppRoutes.moneyRequests,
        name: AppRoutes.moneyRequests,
        builder: (context, state) => const MoneyRequestsPage(),
      ),
    ],
  );
});

// final appRouterProvider = Provider<GoRouter>((ref) {
//   return GoRouter(
//     initialLocation: AppRoutes.onboardingScreen,

//     routes: [
//       GoRoute(
//         path: AppRoutes.signIn,
//         builder: (context, state) => SigninPage(),
//       ),
//       GoRoute(
//         path: AppRoutes.signUp,
//         builder: (context, state) => SignupPage(),
//       ),
//       GoRoute(
//         path: AppRoutes.emailVerification,
//         builder: (context, state) => EmailVerificationPage(),
//       ),

//       GoRoute(
//         path: AppRoutes.home,
//         builder: (context, state) => const HomePage(),
//       ),

//       GoRoute(
//         path: AppRoutes.profile,
//         builder: (context, state) => const ProfilePage(),
//       ),
//       GoRoute(
//         path: AppRoutes.sendMoney,
//         builder: (context, state) => const SendMoneyPage(),
//       ),
//       GoRoute(
//         path: AppRoutes.addMoney,
//         builder: (context, state) => AddMoneyPage(),
//       ),
//     ],
//   );
// });
