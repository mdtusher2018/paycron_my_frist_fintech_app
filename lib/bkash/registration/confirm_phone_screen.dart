import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/presentation/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_otp_text_field.dart';
import 'package:template/src/presentation/shared/widgets/common_rich_text.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class ConfirmPhoneScreen extends StatelessWidget {
  const ConfirmPhoneScreen({super.key});

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
              "Confirm your phone",
              size: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            CommonText("We send 6 digits code to +880 1780 84 57 57", size: 14),
            SizedBox(height: 40.h),

            SizedBox(
              height: 50.h,
              child: Row(
                spacing: 8.w,

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => Expanded(
                    child: CommonOTPTextField(
                      TextEditingController(),
                      index,
                      context,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Center(
              child: CommonRichText(
                parts: [
                  RichTextPart(text: "Didn't get a code? ", size: 14),
                  RichTextPart(
                    text: "Resend",
                    size: 14,
                    isBold: true,
                    haveUnderline: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            CommonButton(
              "Verify Your Number",
              onTap: () {
                context.go(AppRoutes.addEmailScreen);
              },
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
