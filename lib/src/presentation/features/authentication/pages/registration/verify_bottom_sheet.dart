part of 'create_account_screen.dart';

class VerifyBottomSheet extends ConsumerStatefulWidget {
  final String phone;
  final String password;

  const VerifyBottomSheet({
    super.key,
    required this.phone,
    required this.password,
  });

  @override
  ConsumerState<VerifyBottomSheet> createState() => _VerifyBottomSheetState();
}

class _VerifyBottomSheetState extends ConsumerState<VerifyBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final signupState = ref.watch(signupNotifierProvider);
    ref.listen<AsyncValue<SignupEntity?>>(signupNotifierProvider, (prev, next) {
      next.when(
        data: (data) {
          if (data != null) {
            context.pop();
            context.goNamed(AppRoutes.confirmPhoneScreen);
          }
        },
        loading: () {

        },
        error: (error, stackTrace) {
          context.pop();
          ref
              .read(snackBarServiceProvider)
              .showError(error.toString(),context: ref.context);
        },
      );
    });
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset("assets/images/verify.png", height: 120.h),
          SizedBox(height: 20.h),

          CommonText(
            "Verify your email address\nbefore we send code",
            size: 18,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w600,
            maxline: 2,
          ),

          SizedBox(height: 24.h),

          CommonButton(
            "Yes",
            textalign: TextAlign.center,
            isLoading: signupState.isLoading,
            onTap: signupState.isLoading
                ? null
                : () {
                    ref
                        .read(signupNotifierProvider.notifier)
                        .signup(email: widget.phone, password: widget.password);
                  },
          ),

          SizedBox(height: 12.h),

          CommonButton(
            "No",
            textalign: TextAlign.center,
            onTap: signupState.isLoading ? null : () => context.pop(),
            color: Colors.transparent,
            boarder: Border.all(color: AppColors.primary),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
