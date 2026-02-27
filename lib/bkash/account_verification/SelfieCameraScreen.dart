import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class SelfieCameraScreen extends StatelessWidget {
  const SelfieCameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/selfie_sample.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Container(
              width: 280.w,
              height: 380.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200.r),
                border: Border.all(color: Colors.white, width: 3),
              ),
            ),
          ),

          Positioned(
            bottom: 60.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CommonText(
                  "Take your photo at arm's length.\nMake sure your whole face is visible.",
                  size: 14,
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  maxline: 2,
                ),
                SizedBox(height: 20.h),
                Container(
                  width: 70.w,
                  height: 70.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
