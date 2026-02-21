import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/presentation/features/authentication/pages/email_verification_page.dart';
import 'package:template/src/presentation/features/authentication/pages/signin_page.dart';
import 'package:template/src/presentation/features/authentication/pages/signup_page.dart';
import 'package:template/src/presentation/features/home/add_money_view.dart';
import 'package:template/src/presentation/features/home/home_view.dart';
import 'package:template/src/presentation/features/home/send_money_view.dart';
import 'package:template/src/presentation/features/profile/page/profile_page.dart';
import 'package:template/unorganized_files/all_page.dart';
import 'routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.signIn,

    routes: [
      GoRoute(path: AppRoutes.splash, builder: (context, state) => Allpage()),

      GoRoute(path: AppRoutes.allpage, builder: (context, state) => Allpage()),

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
        builder: (context, state) =>  AddMoneyPage(),
      ),
    ],
  );
});
