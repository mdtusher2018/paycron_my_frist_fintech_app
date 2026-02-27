part of 'create_account_screen.dart';

void showVerifyBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    showDragHandle: true,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/verify.png", height: 120.h),
            SizedBox(height: 20.h),

            CommonText(
              "Verify your phone number\nbefore we send code",
              size: 18,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              maxline: 2,
            ),

            SizedBox(height: 10.h),

            CommonText(
              "Is this correct? +880 1780 84 57 57",
              size: 14,
              textAlign: TextAlign.center,
              color: Colors.grey,
            ),

            SizedBox(height: 24.h),

            CommonButton(
              "Yes",
              textalign: TextAlign.center,

              onTap: () {
                context.pushNamed(AppRoutes.confirmPhoneScreen);
              },
            ),

            SizedBox(height: 12.h),

            CommonButton(
              "No",
              textalign: TextAlign.center,
              onTap: () {
                context.pop();
              },
              color: Colors.transparent,
              boarder: Border.all(color: AppColors.primary),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      );
    },
  );
}
