import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';

class EnterPinPage extends StatefulWidget {
  const EnterPinPage({super.key});

  @override
  State<EnterPinPage> createState() => _EnterPinPageState();
}

class _EnterPinPageState extends State<EnterPinPage> {
  String pin = "";

  void addDigit(String digit) {
    if (pin.length < 4) {
      setState(() {
        pin += digit;
      });

      if (pin.length == 4) {
        Future.delayed(const Duration(milliseconds: 300), () {
          context.goNamed(AppRoutes.transactionCompletePage);
        });
      }
    }
  }

  void deleteDigit() {
    if (pin.isNotEmpty) {
      setState(() {
        pin = pin.substring(0, pin.length - 1);
      });
    }
  }

  Widget pinDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          height: 16.h,
          width: 16.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < pin.length ? Colors.blue : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget numberButton(String number) {
    return GestureDetector(
      onTap: () => addDigit(number),
      child: Container(
        height: 70.h,
        width: 70.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade100,
        ),
        child: CommonText(number, size: 22, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget keypad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [numberButton("1"), numberButton("2"), numberButton("3")],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [numberButton("4"), numberButton("5"), numberButton("6")],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [numberButton("7"), numberButton("8"), numberButton("9")],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 70),
            numberButton("0"),
            GestureDetector(
              onTap: deleteDigit,
              child: Container(
                height: 70.h,
                width: 70.h,
                alignment: Alignment.center,
                child: const Icon(Icons.backspace_outlined),
              ),
            ),
          ],
        ),
      ],
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
            SizedBox(height: 20.h),

            const CommonText(
              "Enter Your PIN",
              size: 22,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 6.h),

            const CommonText(
              "Confirm your payment securely",
              size: 13,
              color: Colors.grey,
            ),

            SizedBox(height: 40.h),

            /// PIN dots
            pinDots(),

            SizedBox(height: 60.h),

            /// Keypad
            keypad(),
          ],
        ),
      ),
    );
  }
}
