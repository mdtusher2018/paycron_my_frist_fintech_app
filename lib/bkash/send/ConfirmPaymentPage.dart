import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';


class ConfirmPaymentPage extends StatelessWidget {
  const ConfirmPaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35.r,
              backgroundImage: const AssetImage("assets/user.jpg"),
            ),

            SizedBox(height: 10.h),

            const CommonText("Mehedi Hasan"),
            const CommonText(
              "hello@yourmail@gmail.com",
              size: 12,
              color: Colors.grey,
            ),

            SizedBox(height: 30.h),

            const CommonText(
              "\$500",
              size: 40,
              fontWeight: FontWeight.bold,
            ),

            SizedBox(height: 20.h),

            Row(
              children: [
                const Icon(Icons.credit_card),
                SizedBox(width: 10.w),
                const CommonText("Account ****9934")
              ],
            ),

            const Spacer(),

            CommonButton(
              "Pay \$500",
              textalign: TextAlign.center,
              onTap: () {},
            ),

            SizedBox(height: 20.h)
          ],
        ),
      ),
    );
  }
}