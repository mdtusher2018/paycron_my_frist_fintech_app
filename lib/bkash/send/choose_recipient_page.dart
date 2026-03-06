import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text_field.dart';

class ChooseRecipientPage extends StatelessWidget {
  const ChooseRecipientPage({super.key});

  Widget recipientItem(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22.r,
            backgroundImage: const AssetImage("assets/user.jpg"),
          ),
          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonText(
                  "Mehedi Hasan",
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 2.h),
                CommonText(
                  "hello@yourmail@gmail.com",
                  size: 12,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const CommonText(
              "-\$100",
              size: 12,
              color: Colors.red,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: CommonTextField(
        hintText: "Search recipient email",
        boarderRadious: 50,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CommonText(
              "Choose Recipient",
              size: 22,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 6.h),

            CommonText(
              "Select who you want to send money to.",
              size: 13,
              color: Colors.grey.shade600,
            ),

            SizedBox(height: 16.h),

            /// Search
            searchField(),

            SizedBox(height: 10.h),
            CommonButton("Send"),
            SizedBox(height: 10.h),

            /// Section Title
            const CommonText(
              "Most Recent",
              size: 14,
              fontWeight: FontWeight.w600,
            ),

            SizedBox(height: 10.h),

            /// Recipients
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    onTap: () {
                      context.goNamed(AppRoutes.selectPurposeScreen);
                    },
                    child: recipientItem(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
