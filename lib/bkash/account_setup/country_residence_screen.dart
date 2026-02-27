import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class CountryResidenceScreen extends StatefulWidget {
  const CountryResidenceScreen({super.key});

  @override
  State<CountryResidenceScreen> createState() => _CountryResidenceScreenState();
}

class _CountryResidenceScreenState extends State<CountryResidenceScreen> {
  String selectedCountry = "Bangladesh";

  final List<String> countries = [
    "Bangladesh",
    "United State",
    "Singapore",
    "India",
  ];

  @override
  Widget build(BuildContext context) {
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
              "This info needs to be accurate with your ID document.",
              size: 14,
              color: Colors.grey,
            ),
            SizedBox(height: 30.h),

            DropdownButtonFormField<String>(
              value: selectedCountry,
              items: countries
                  .map(
                    (country) =>
                        DropdownMenuItem(value: country, child: Text(country)),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            const Spacer(),

            CommonButton("Continue", textalign: TextAlign.center),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
