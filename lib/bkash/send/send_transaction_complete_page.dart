import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';

class SendTransactionCompletePage extends StatelessWidget {
  const SendTransactionCompletePage({super.key});

  Widget successIcon() {
    return Container(
      height: 90.h,
      width: 90.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.green.withOpacity(.1),
      ),
      child: Icon(Icons.check_circle, color: Colors.green, size: 60.sp),
    );
  }

  Widget recipientCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundImage: const AssetImage("assets/user.jpg"),
          ),

          SizedBox(width: 14.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CommonText("Mehedi Hasan", size: 15, fontWeight: FontWeight.w600),
              CommonText("hello@email.com", size: 12, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget transactionCard() {
    return Container(
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const CommonText("Amount Sent", size: 13, color: Colors.grey),

          SizedBox(height: 8.h),

          const CommonText(
            "\$500.00",
            size: 32,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),

          SizedBox(height: 12.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CommonText("Transaction ID", size: 12, color: Colors.grey),
              CommonText("#TX984534"),
            ],
          ),

          SizedBox(height: 6.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              CommonText("Date", size: 12, color: Colors.grey),
              CommonText("22 Feb 2026"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),

              /// Success icon
              successIcon(),

              SizedBox(height: 20.h),

              const CommonText(
                "Transaction Successful",
                size: 22,
                fontWeight: FontWeight.w700,
              ),

              SizedBox(height: 6.h),

              const CommonText(
                "Your money has been sent successfully",
                size: 13,
                color: Colors.grey,
              ),

              SizedBox(height: 30.h),

              /// Amount card
              transactionCard(),

              SizedBox(height: 20.h),

              /// Recipient
              recipientCard(),

              const Spacer(),

              /// Buttons
              CommonButton(
                "Back to Homepage",
                textalign: TextAlign.center,
                onTap: () {
                  context.goNamed(AppRoutes.home);
                },
              ),

              SizedBox(height: 12.h),

              CommonButton(
                "Make another Payment",
                textalign: TextAlign.center,
                color: Colors.white,
                textColor: Colors.blue,
                boarder: Border.all(color: Colors.blue),
                onTap: () {},
              ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
