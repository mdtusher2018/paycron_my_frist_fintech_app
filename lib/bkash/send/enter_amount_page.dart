import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';

class EnterAmountPage extends StatefulWidget {
  const EnterAmountPage({super.key});

  @override
  State<EnterAmountPage> createState() => _EnterAmountPageState();
}

class _EnterAmountPageState extends State<EnterAmountPage> {
  final TextEditingController amountController = TextEditingController();

  Widget quickAmount(double amount) {
    return GestureDetector(
      onTap: () {
        amountController.text = amount.toString();
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: CommonText(
          "\$${amount.toInt()}",
          size: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget recipientCard() {
    return Container(
      padding: EdgeInsets.all(14.w),
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
            radius: 26.r,
            backgroundImage: const AssetImage("assets/user.jpg"),
          ),

          SizedBox(width: 12.w),

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

  Widget amountField() {
    return SizedBox(
      width: 180,
      child: TextField(
        controller: amountController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(hintText: "\$0"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),

      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),

            /// Recipient
            recipientCard(),

            SizedBox(height: 40.h),

            /// Title
            const CommonText(
              "Enter Amount",
              size: 18,
              fontWeight: FontWeight.w600,
            ),

            SizedBox(height: 10.h),

            /// Amount input
            amountField(),

            SizedBox(height: 30.h),

            /// Quick amount buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                quickAmount(50),
                quickAmount(100),
                quickAmount(200),
                quickAmount(500),
              ],
            ),

            const Spacer(),

            /// Continue Button
            CommonButton(
              "Continue",
              textalign: TextAlign.center,
              onTap: () {
                context.goNamed(AppRoutes.enterPinScreen);
              },
            ),

            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
