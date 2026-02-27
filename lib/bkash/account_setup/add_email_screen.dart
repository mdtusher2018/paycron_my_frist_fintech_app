import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/config/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class AddEmailScreen extends StatelessWidget {
  const AddEmailScreen({super.key});

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
            CommonText("Add your email", size: 20, fontWeight: FontWeight.w600),
            SizedBox(height: 8.h),
            CommonText(
              "This info needs to be accurate with your ID document.",
              size: 14,
              color: Colors.grey,
            ),
            SizedBox(height: 30.h),

            CommonText("Email", size: 14),
            SizedBox(height: 8.h),

            TextField(
              decoration: InputDecoration(
                hintText: "name@example.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            const Spacer(),

            CommonButton(
              "Continue",
              onTap: () {
                context.push(AppRoutes.homeAddressScreen);
              },
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
