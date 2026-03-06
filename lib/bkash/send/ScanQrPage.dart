import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';

class ScanQrPage extends StatelessWidget {
  const ScanQrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff4D6CFA), Color(0xff2A46E8)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/qr.png", height: 220.h),

            SizedBox(height: 30.h),

            const CommonText("Scan a QR To Pay", size: 18, color: Colors.white),

            SizedBox(height: 10.h),

            CommonText(
              "Hold the code inside the frame",
              size: 13,
              color: Colors.white.withOpacity(.7),
            ),

            SizedBox(height: 40.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.flash_on, color: Colors.white),
                SizedBox(width: 30),
                Icon(Icons.radio_button_checked, color: Colors.white),
                SizedBox(width: 30),
                Icon(Icons.flip_camera_ios, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
