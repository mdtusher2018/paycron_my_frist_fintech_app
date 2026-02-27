import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/config/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

part 'verify_bottom_sheet.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              "Create an Account",
              size: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            CommonText(
              "Enter your mobile number to verify your account",
              size: 14,
              color: Colors.grey,
            ),
            SizedBox(height: 30.h),

            /// Phone Field
            TextField(
              decoration: InputDecoration(
                prefixText: "+880 ",
                hintText: "Mobile number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            /// Password Field
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 40),

            CommonButton(
              "Sign up",
              textalign: TextAlign.center,

              onTap: () {
                showVerifyBottomSheet(context);
              },
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
