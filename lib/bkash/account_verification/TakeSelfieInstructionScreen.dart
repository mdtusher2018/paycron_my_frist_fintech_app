import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class TakeSelfieInstructionScreen extends StatelessWidget {
  const TakeSelfieInstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(backgroundColor: AppColors.mainBG, elevation: 0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),

            Image.asset("assets/images/selfie_instruction.png", height: 180.h),

            SizedBox(height: 30.h),

            CommonText(
              "Take selfie to verify\nyour identity",
              size: 20,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              maxline: 2,
            ),

            SizedBox(height: 12.h),

            CommonText(
              "Quick and easy identification verification using your phone's camera.",
              size: 14,
              color: Colors.grey,
              textAlign: TextAlign.center,
              maxline: 3,
            ),

            const Spacer(),

            CommonButton("Take a selfie", textalign: TextAlign.center),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
