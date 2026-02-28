import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/presentation/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';

class AccountSetupProgressScreen extends StatelessWidget {
  const AccountSetupProgressScreen({super.key});

  Widget buildStep(
    String title,
    bool isDone,
    bool isActive, {
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDone
                        ? AppColors.primary
                        : isActive
                        ? AppColors.primary.withOpacity(0.2)
                        : Colors.grey.shade300,
                  ),
                  child: isDone
                      ? const Icon(Icons.check, size: 14, color: Colors.white)
                      : null,
                ),
                SizedBox(width: 12.w),
                CommonText(
                  title,
                  size: 14,
                  color: isDone || isActive ? Colors.black : Colors.grey,
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_rounded,
            color: AppColors.primary.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(
        backgroundColor: AppColors.mainBG,
        elevation: 0,

        actions: [
          InkWell(
            onTap: () {
              context.goNamed(AppRoutes.home);
            },
            child: CommonText("Skip >>"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            Image.asset("assets/images/setup.png", height: 180.h),

            SizedBox(height: 30.h),

            CommonText(
              "Setting up\nyour account",
              size: 22,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              maxline: 2,
            ),

            SizedBox(height: 16.h),

            CommonText(
              "We are analyzing your data to verify",
              size: 14,
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 40.h),

            buildStep(
              "Phone verified",
              true,
              false,
              onTap: () {
                context.goNamed(AppRoutes.takeSelfieInstructionScreen);
              },
            ),
            SizedBox(height: 20.h),
            buildStep(
              "Checking up document ID",
              true,
              false,
              onTap: () {
                context.goNamed(AppRoutes.scanIdScreen);
              },
            ),
            SizedBox(height: 20.h),
            buildStep("Verifying photo", false, true, onTap: () {}),

            const Spacer(),
            CommonButton(
              "Continue",
              onTap: () {
                context.goNamed(AppRoutes.accountSetupProgressScreen);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
