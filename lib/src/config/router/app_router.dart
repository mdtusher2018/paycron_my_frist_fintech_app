import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/features/authentication/presentation/pages/email_verification_page.dart';
import 'package:template/src/features/authentication/presentation/pages/signin_page.dart';
import 'package:template/src/features/authentication/presentation/pages/signup_page.dart';
import 'package:template/src/features/profile/presentation/page/profile_page.dart';
import 'package:template/unorganized_files/all_page.dart';

import '../../../unorganized_files/home_page.dart';
import 'routes.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.createPost,

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
    ],
  );
});
