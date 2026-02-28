import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/bkash/account_verification/AccountSetupProgressScreen.dart';
import 'package:template/bkash/account_verification/IdVerificationProgressScreen.dart';
import 'package:template/bkash/account_verification/ScanIdScreen.dart';
import 'package:template/bkash/account_verification/SelfieCameraScreen.dart';
import 'package:template/bkash/account_verification/TakeSelfieInstructionScreen.dart';
import 'package:template/bkash/registration/confirm_phone_screen.dart';
import 'package:template/bkash/registration/create_account_intro_screen.dart';
import 'package:template/bkash/registration/create_account_screen.dart';
import 'package:template/bkash/on_boarding/onboarding_screen.dart';
import 'package:template/bkash/account_setup/add_email_screen.dart';
import 'package:template/bkash/account_setup/add_personal_info_screen.dart';
import 'package:template/bkash/account_setup/country_residence_screen.dart';
import 'package:template/bkash/account_setup/home_address_screen.dart';
import 'package:template/src/presentation/features/authentication/pages/email_verification_page.dart';
import 'package:template/src/presentation/features/authentication/pages/signin_page.dart';
import 'package:template/src/presentation/features/authentication/pages/signup_page.dart';
import 'package:template/src/presentation/features/home/add_money_view.dart';
import 'package:template/src/presentation/features/home/home_view.dart';
import 'package:template/src/presentation/features/home/send_money_view.dart';
// import 'package:template/src/presentation/features/profile/page/profile_page.dart';
import 'routes.dart';

part 'parts/onboarding_routes.dart';
part 'parts/account_setup_routes.dart';
part 'parts/registration_routes.dart';
part 'parts/account_verification_routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.onboardingScreen,
    routes: [
      ..._onboardingRoutes(),
      ..._registrationRoutes(),
      ..._accountSetupRoutes(),
      ..._accountVerificationRoutes(),

      GoRoute(
        path: AppRoutes.signIn,
        builder: (context, state) => SigninPage(),
      ),
      GoRoute(
        path: AppRoutes.signUp,
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: AppRoutes.emailVerification,
        builder: (context, state) => EmailVerificationPage(),
      ),

      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),

      // GoRoute(
      //   path: AppRoutes.profile,
      //   builder: (context, state) => const ProfilePage(),
      // ),
      GoRoute(
        path: AppRoutes.sendMoney,
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
