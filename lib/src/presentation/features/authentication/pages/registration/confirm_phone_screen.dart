import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/domain/entites/auth_entity.dart';
import 'package:paycron_app/src/presentation/features/authentication/notifiers/email_verified_notifier.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_otp_text_field.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_rich_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';

class ConfirmPhoneScreen extends ConsumerStatefulWidget {
  const ConfirmPhoneScreen({super.key});

  @override
  ConsumerState<ConfirmPhoneScreen> createState() => _ConfirmPhoneScreenState();
}

class _ConfirmPhoneScreenState extends ConsumerState<ConfirmPhoneScreen> {
  late final List<TextEditingController> _otpControllers;

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(6, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var c in _otpControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(emailVerifiedNotifierProvider).isLoading;
    // Listen for verification **once**
    ref.listen<AsyncValue<EmailVerifiedEntity?>>(
      emailVerifiedNotifierProvider,
      (prev, next) {
        next.whenData((data) {
          if (data != null) {
            // Navigate only on real success
            context.goNamed(AppRoutes.addPersonalInfoScreen);
          }
        });

        next.whenOrNull(
          error: (err, _) {
            ref.read(snackBarServiceProvider).showError(
                  err.toString(),
                  context: context,
                );
          },
        );
      },
    );
  
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
            CommonText(
              "Confirm your phone",
              size: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            CommonText("We send 6 digits code to you number", size: 14),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                _otpControllers.length,
                (index) => Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: CommonOTPTextField(
                      _otpControllers[index],
                      index,
                      context,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: CommonRichText(
                parts: [
                  RichTextPart(text: "Didn't get a code? ", size: 14),
                  RichTextPart(
                    text: "Resend",
                    size: 14,
                    isBold: true,
                    haveUnderline: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            CommonButton(
              "Verify Your Number",
              isLoading: isLoading,
              onTap: () {
                final otp = _otpControllers.map((c) => c.text.trim()).join();
                ref
                    .read(emailVerifiedNotifierProvider.notifier)
                    .verifyEmail(otp: otp);
              },
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
