import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/domain/entites/auth_entity.dart';

import 'package:paycron_app/src/presentation/features/authentication/notifiers/signup_notifier.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text_field.dart';
part 'verify_bottom_sheet.dart';

class CreateAccountScreen extends StatelessWidget {
   CreateAccountScreen({super.key});

  final phoneCtrl = TextEditingController(text: kDebugMode ? "hello123@gmail.com" : null);

  final passCtrl = TextEditingController(text: kDebugMode ? "hello123" : null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(
        backgroundColor: AppColors.mainBG,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                "Create an Account",
                size: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8.h),
              CommonText(
                "Enter your phone address to verify your account",
                size: 14,
                color: Colors.grey,
              ),
              SizedBox(height: 30.h),

              /// Phone Field
              CommonTextField(
                controller: phoneCtrl,
                hintText: "Phone Number (use email)",
                prefixIcon: Icon(Icons.phone, color: AppColors.grey),
              ),

              SizedBox(height: 20.h),

              CommonTextField(controller: passCtrl, hintText: "Password"),

              SizedBox(height: 40),

              CommonButton(
                "Sign up",
                textalign: TextAlign.center,

                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    builder: (_) => VerifyBottomSheet(
                      phone: phoneCtrl.text,
                      password: passCtrl.text,
                    ),
                  );
                },
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
