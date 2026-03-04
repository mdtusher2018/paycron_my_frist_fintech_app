import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:paycron_app/src/presentation/router/routes.dart';
import 'package:paycron_app/src/presentation/shared/themes/colors.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_button.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text.dart';
import 'package:paycron_app/src/presentation/shared/widgets/common_text_field.dart';

class HomeAddressScreen extends StatefulWidget {
  final Map<String, dynamic> personalInfo;

  const HomeAddressScreen({super.key, required this.personalInfo});
  @override
  State<HomeAddressScreen> createState() => _HomeAddressScreenState();
}

class _HomeAddressScreenState extends State<HomeAddressScreen> {
  final TextEditingController roadCtrl = TextEditingController();
  final TextEditingController cityCtrl = TextEditingController();
  final TextEditingController stateCtrl = TextEditingController();
  final TextEditingController postalCtrl = TextEditingController();

  Widget buildField(String hint, TextEditingController ctrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextField(controller: ctrl, hintText: hint),
        SizedBox(height: 16.h),
      ],
    );
  }

  @override
  void dispose() {
    roadCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    postalCtrl.dispose();
    super.dispose();
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonText(
                "Home address",
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
                          
              buildField("Address Line", roadCtrl),
              buildField("City", cityCtrl),
              buildField("State", stateCtrl),
              buildField("Postcode", postalCtrl),
              SizedBox(height: 16,),
              CommonButton(
                "Continue",
                onTap: () {
                  if (roadCtrl.text.isEmpty ||
                      cityCtrl.text.isEmpty ||
                      stateCtrl.text.isEmpty ||
                      postalCtrl.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields")),
                    );
                    return;
                  }
          
                  // Pass all previous + current info
                  context.pushNamed(
                    AppRoutes.countryResidenceScreen,
                    extra: {
                      ...widget.personalInfo,
                      "address": {
                        "road": roadCtrl.text,
                        "city": cityCtrl.text,
                        "state": stateCtrl.text,
                        "postal_code": postalCtrl.text,
                      },
                    },
                  );
                },
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
