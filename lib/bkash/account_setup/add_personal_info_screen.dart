import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/config/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class AddPersonalInfoScreen extends StatefulWidget {
  const AddPersonalInfoScreen({super.key});

  @override
  State<AddPersonalInfoScreen> createState() => _AddPersonalInfoScreenState();
}

class _AddPersonalInfoScreenState extends State<AddPersonalInfoScreen> {
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(1994),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
              "Add your personal info",
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

            CommonText("Full Name", size: 14),
            SizedBox(height: 8.h),
            TextField(
              decoration: InputDecoration(
                hintText: "Mr. Jhon Doe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            CommonText("Username", size: 14),
            SizedBox(height: 8.h),
            TextField(
              decoration: InputDecoration(
                hintText: "@username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),

            SizedBox(height: 16.h),

            CommonText("Date of Birth", size: 14),
            SizedBox(height: 8.h),
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                      selectedDate == null
                          ? "MM/DD/YYYY"
                          : "${selectedDate!.month}/${selectedDate!.day}/${selectedDate!.year}",
                      size: 14,
                      color: selectedDate == null ? Colors.grey : Colors.black,
                    ),
                    const Icon(Icons.calendar_today, size: 18),
                  ],
                ),
              ),
            ),

            const Spacer(),

            CommonButton(
              "Continue",
              onTap: () {
                context.push(AppRoutes.countryResidenceScreen);
              },
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
