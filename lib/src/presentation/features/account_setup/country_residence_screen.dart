import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/domain/entites/profile_entity.dart';
import 'package:paycron_app/src/presentation/features/account_setup/notifiers/complete_profile_notifier.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';

class CountryResidenceScreen extends ConsumerStatefulWidget {
  final Map<String, dynamic> personalAndAddressInfo;

  const CountryResidenceScreen({
    super.key,
    required this.personalAndAddressInfo,
  });

  @override
  ConsumerState<CountryResidenceScreen> createState() =>
      _CountryResidenceScreenState();
}

class _CountryResidenceScreenState
    extends ConsumerState<CountryResidenceScreen> {
  String selectedCountry = "Bangladesh";

  final List<String> countries = [
    "Bangladesh",
    "United States",
    "Singapore",
    "India",
  ];

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(completeProfileNotifierProvider);

    ref.listen<AsyncValue<CompleteProfileEntity?>>(
      completeProfileNotifierProvider,
      (previous, next) {
        next.whenOrNull(
          data: (_) {
          context.goNamed(AppRoutes.home);
          },
          error: (e, st) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Error: $e")));
          },
          loading: () {
            // optional: can show a dialog or loading indicator
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
              "Country of residence",
              size: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8.h),
            CommonText(
              "This info needs to match your ID document.",
              size: 14,
              color: Colors.grey,
            ),
            SizedBox(height: 30.h),

            DropdownButtonFormField<String>(
              value: selectedCountry,
              items: countries
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) => setState(() => selectedCountry = value!),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            const Spacer(),

            CommonButton(
              "Complete Profile",
              isLoading: profileState.isLoading,
              onTap: () {
                final payload = {
                  ...widget.personalAndAddressInfo,
                  "address": {
                    ...widget.personalAndAddressInfo['address'] ?? {},
                    "country": selectedCountry,
                  },
                };

                ref
                    .read(completeProfileNotifierProvider.notifier)
                    .completeProfile(payload);
              },
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
