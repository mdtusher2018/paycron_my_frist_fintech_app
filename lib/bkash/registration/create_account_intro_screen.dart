import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/presentation/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class CreateAccountIntroScreen extends StatelessWidget {
  const CreateAccountIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),

              Image.asset("assets/images/register_intro.jpg", height: 220.h),

              SizedBox(height: 20.h),

              CommonText(
                "Create your\nCoinpay account",
                size: 24,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w600,
                maxline: 2,
              ),

              SizedBox(height: 16.h),

              CommonText(
                "Coinpay is a powerful tool that allows you to easily send, receive, and track all your transactions.",
                size: 14,
                textAlign: TextAlign.center,
                color: Colors.grey,
                maxline: 3,
              ),

              SizedBox(height: 40.h),

              CommonButton(
                "Sign up",
                textalign: TextAlign.center,
                onTap: () {
                  context.push(AppRoutes.createAccountScreen);
                },
              ),

              SizedBox(height: 16.h),

              CommonButton(
                "Log in",
                textalign: TextAlign.center,
                onTap: () {
                  context.push(AppRoutes.signIn);
                },
                color: Colors.transparent,
                boarder: Border.all(color: AppColors.primary),
              ),

              const Spacer(),

              CommonText(
                "By continuing you accept our\nTerms of Service and Privacy Policy",
                size: 12,
                textAlign: TextAlign.center,
                color: Colors.grey,
                maxline: 2,
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
