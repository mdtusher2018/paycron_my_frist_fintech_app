import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/core/base/failure.dart';
import 'package:paycron_app/src/core/base/result.dart';
import 'package:paycron_app/src/core/di/dependency_injection.dart';
import 'package:paycron_app/src/core/utils/extension/validator_extension.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text_field.dart';

class ChooseRecipientPage extends ConsumerWidget {
  ChooseRecipientPage({super.key});
  final TextEditingController recipentTextEditingController =
      TextEditingController(text: kDebugMode ? "tusher@gmail.com" : null);

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
            backgroundImage: NetworkImage(
              "https://static.vecteezy.com/system/resources/previews/015/399/302/non_2x/trendy-male-model-vector.jpg",
            ),
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
        controller: recipentTextEditingController,
        boarderRadious: 50,
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  void _sendMoney(WidgetRef ref) async {
    final email = recipentTextEditingController.text;
    if (!email.isValidEmail) {
      ref
          .read(snackBarServiceProvider)
          .showError("Invalid Email",context: ref.context);
      return;
    }
          // Show loading
      showDialog(
        context: ref.context,
        barrierDismissible: false,
        builder: (_) => const Center(child: CircularProgressIndicator()),
      );

    final response = await ref
        .read(homeUsecaseProvider)
        .checkEmailExists(email: email);

      Navigator.of(ref.context).pop(); // Close loading


    if (response is Success<bool, Failure>) {
      ref.context.pushNamed(
        AppRoutes.sendSelectPurpose,
        extra: {"email": email},
      );
    } else {
      ref
          .read(snackBarServiceProvider)
          .showError("User not Exist",context: ref.context);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      appBar: AppBar(
        backgroundColor: AppColors.mainBG,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: SingleChildScrollView(
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
              CommonButton(
                "Send",
                
                onTap: () {
                  _sendMoney(ref);
                },
              ),
              SizedBox(height: 10.h),

              /// Section Title
              const CommonText(
                "Most Recent",
                size: 14,
                fontWeight: FontWeight.w600,
              ),

              SizedBox(height: 10.h),

              /// Recipients
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(0),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    onTap: () {
                      _sendMoney(ref);
                    },
                    child: recipientItem(context),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
