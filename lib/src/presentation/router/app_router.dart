import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/bkash/account_verification/AccountSetupProgressScreen.dart';
import 'package:paycron_app/bkash/account_verification/IdVerificationProgressScreen.dart';
import 'package:paycron_app/bkash/account_verification/ScanIdScreen.dart';
import 'package:paycron_app/bkash/account_verification/SelfieCameraScreen.dart';
import 'package:paycron_app/bkash/account_verification/TakeSelfieInstructionScreen.dart';
import 'package:paycron_app/bkash/send/choose_recipient_page.dart';
import 'package:paycron_app/bkash/send/enter_pin_page.dart';
import 'package:paycron_app/bkash/send/enter_amount_page.dart';
import 'package:paycron_app/bkash/send/scan_qr_page.dart';
import 'package:paycron_app/bkash/send/select_purpose_page.dart';
import 'package:paycron_app/bkash/send/transaction_complete_page.dart';
import 'package:paycron_app/src/presentation/features/authentication/pages/registration/confirm_phone_screen.dart';
import 'package:paycron_app/bkash/on_boarding/create_account_intro_screen.dart';
import 'package:paycron_app/src/presentation/features/authentication/pages/registration/create_account_screen.dart';
import 'package:paycron_app/bkash/on_boarding/onboarding_screen.dart';
import 'package:paycron_app/src/presentation/features/account_setup/add_personal_info_screen.dart';
import 'package:paycron_app/src/presentation/features/account_setup/country_residence_screen.dart';
import 'package:paycron_app/src/presentation/features/account_setup/home_address_screen.dart';
import 'package:paycron_app/src/presentation/features/authentication/pages/signin_page.dart';
import 'package:paycron_app/src/presentation/features/home/add_money_view.dart';
import 'package:paycron_app/src/presentation/features/home/home_view.dart';
import 'package:paycron_app/src/presentation/features/home/send_money_view.dart';
import 'routes.dart';

part 'parts/onboarding_routes.dart';
part 'parts/account_setup_routes.dart';
part 'parts/registration_routes.dart';
part 'parts/account_verification_routes.dart';
part 'parts/send_money_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.chooseRecipientScreen,
    routes: [
      ..._onboardingRoutes(),
      ..._registrationRoutes(),
      ..._accountSetupRoutes(),
      ..._accountVerificationRoutes(),
      ..._sendMoneyRoutes(),

      GoRoute(
        path: AppRoutes.signIn,
        name: AppRoutes.signIn,
        builder: (context, state) => SigninPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
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
