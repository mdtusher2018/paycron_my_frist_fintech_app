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
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text_field.dart';

class ChooseSenderPage extends ConsumerStatefulWidget {
  const ChooseSenderPage({super.key});

  @override
  ConsumerState<ChooseSenderPage> createState() => _ChooseSenderPageState();
}

class _ChooseSenderPageState extends ConsumerState<ChooseSenderPage> {
  final TextEditingController senderTextEditingController =
      TextEditingController(text: kDebugMode ? "tusher@gmail.com" : null);

  Widget senderItem(BuildContext context) {
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
              color: Colors.green.withOpacity(.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: const CommonText(
              "+\$100",
              size: 12,
              color: Colors.green,
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
      child: const CommonTextField(
        hintText: "Search sender email",
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
              "Choose Sender",
              size: 22,
              fontWeight: FontWeight.w700,
            ),

            SizedBox(height: 6.h),

            CommonText(
              "Select who will send you money.",
              size: 13,
              color: Colors.grey.shade600,
            ),

            SizedBox(height: 16.h),

            /// Search
            searchField(),

            SizedBox(height: 10.h),

            CommonButton(
              "Receive",
              onTap: () {
                _reciveRequestMoney();
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

            /// Sender list
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(14.r),
                    onTap: () {
                      context.goNamed(AppRoutes.receiveSelectPurpose);
                    },
                    child: senderItem(context),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _reciveRequestMoney() async {
    final email = senderTextEditingController.text;
    if (!email.isValidEmail) {
      ref
          .read(snackBarServiceProvider)
          .showError("Invalid Email", context: ref.context);
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
        AppRoutes.receiveSelectPurpose,
        extra: {"email": email},
      );
    } else {
      ref
          .read(snackBarServiceProvider)
          .showError("User not Exist", context: ref.context);
    }
  }
}
