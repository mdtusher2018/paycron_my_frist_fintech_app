import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class IdVerificationProgressScreen extends StatelessWidget {
  const IdVerificationProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/id_card.png", height: 140.h),

            SizedBox(height: 40.h),

            CommonText(
              "ID verification\nin progress",
              size: 20,
              color: Colors.white,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              maxline: 2,
            ),

            SizedBox(height: 12.h),

            CommonText(
              "Hold tight, it won't take long",
              size: 14,
              color: Colors.white70,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30.h),

            LinearProgressIndicator(
              backgroundColor: Colors.white24,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
