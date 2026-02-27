import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class AccountSetupProgressScreen extends StatelessWidget {
  const AccountSetupProgressScreen({super.key});

  Widget buildStep(String title, bool isDone, bool isActive) {
    return Row(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(
        backgroundColor: AppColors.mainBG,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
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

            buildStep("Phone verified", true, false),
            SizedBox(height: 20.h),
            buildStep("Checking up document ID", true, false),
            SizedBox(height: 20.h),
            buildStep("Verifying photo", false, true),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
