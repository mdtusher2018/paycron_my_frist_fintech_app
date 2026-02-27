import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
import 'package:template/src/presentation/features/profile/page/profile_page.dart';
import 'routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.onboardingScreen,

    routes: [
      /// ================= ONBOARDING =================
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => const OnboardingScreen(),
      ),

      /// ================= REGISTRATION =================
      GoRoute(
        path: AppRoutes.createAccountIntroScreen,
        builder: (context, state) => const CreateAccountIntroScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.createAccountScreen,
            builder: (context, state) => const CreateAccountScreen(),
            routes: [
              GoRoute(
                path: AppRoutes.confirmPhoneScreen,
                builder: (context, state) => const ConfirmPhoneScreen(),
              ),
            ],
          ),
        ],
      ),

      /// ================= ACCOUNT SETUP =================
      GoRoute(
        path: AppRoutes.addEmailScreen,
        builder: (context, state) => const AddEmailScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.homeAddressScreen,
            builder: (context, state) => const HomeAddressScreen(),
            routes: [
              GoRoute(
                path: AppRoutes.addPersonalInfoScreen,
                builder: (context, state) => const AddPersonalInfoScreen(),
                routes: [
                  GoRoute(
                    path: AppRoutes.countryResidenceScreen,
                    builder: (context, state) => const CountryResidenceScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      ////========================
      //  End
      ////========================
      ///
      ///
      ///
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
        builder: (context, state) => const HomePage(),
      ),

      GoRoute(
        path: AppRoutes.profile,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        path: AppRoutes.sendMoney,
        builder: (context, state) => const SendMoneyPage(),
      ),
      GoRoute(
        path: AppRoutes.addMoney,
        builder: (context, state) => AddMoneyPage(),
      ),
    ],
  );
});
