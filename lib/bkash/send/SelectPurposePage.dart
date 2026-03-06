import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';

class SelectPurposePage extends StatefulWidget {
  const SelectPurposePage({super.key});

  @override
  State<SelectPurposePage> createState() => _SelectPurposePageState();
}

class _SelectPurposePageState extends State<SelectPurposePage> {
  int selected = 0;

  Widget purposeItem({
    required String title,
    required String subtitle,
    required int index,
    required IconData icon,
  }) {
    final bool isSelected = selected == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 14.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(.05) : Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.grey.withOpacity(0.3),
            width: isSelected ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.03),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            /// Icon Container
            Container(
              height: 42.h,
              width: 42.h,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(.15)
                    : AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.grey,
                size: 22.sp,
              ),
            ),

            SizedBox(width: 14.w),

            /// Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(title, size: 15, fontWeight: FontWeight.w600),
                  SizedBox(height: 3.h),
                  CommonText(subtitle, size: 12, color: AppColors.grey),
                ],
              ),
            ),

            /// Custom radio indicator
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 22.h,
              width: 22.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grey
                    ..withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        height: 10.h,
                        width: 10.h,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(elevation: 0, backgroundColor: AppColors.mainBG),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              "Select a Purpose",
              size: 22,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 6.h),

            CommonText(
              "Select a method for sending money",
              size: 13,
              color: AppColors.grey..withOpacity(0.6),
            ),

            SizedBox(height: 24.h),

            /// Options
            purposeItem(
              title: "Personal",
              subtitle: "Pay your friends and family",
              index: 0,
              icon: Icons.person_outline,
            ),

            purposeItem(
              title: "Business",
              subtitle: "Pay for business services",
              index: 1,
              icon: Icons.business_center_outlined,
            ),

            purposeItem(
              title: "Payment",
              subtitle: "Pay for goods or bills",
              index: 2,
              icon: Icons.payment_outlined,
            ),

            const Spacer(),

            /// Continue Button
            CommonButton(
              "Continue",
              textalign: TextAlign.center,
              onTap: () {
                context.goNamed(AppRoutes.enterAmountScreen);
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
