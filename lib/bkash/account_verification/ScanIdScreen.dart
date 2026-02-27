import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class ScanIdScreen extends StatelessWidget {
  const ScanIdScreen({super.key});

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

            Image.asset("assets/images/scan_id.png", height: 200.h),

            SizedBox(height: 30.h),

            CommonText(
              "Scan ID document to\nverify your identity",
              size: 20,
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.center,
              maxline: 2,
            ),

            SizedBox(height: 12.h),

            CommonText(
              "Confirm your identity with just a few taps",
              size: 14,
              color: Colors.grey,
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            CommonButton("Scan", textalign: TextAlign.center),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
