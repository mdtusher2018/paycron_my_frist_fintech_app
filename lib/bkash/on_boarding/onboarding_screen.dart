import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/config/router/routes.dart';
import 'package:template/src/presentation/shared/themes/colors.dart';
import 'package:template/src/presentation/shared/widgets/common_button.dart';
import 'package:template/src/presentation/shared/widgets/common_text.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> titles = [
    "Trusted by millions of people, part of one part",
    "Spend money abroad, and track your expense",
    "Receive Money \nFrom Anywhere In \nThe World",
  ];

  final List<String> images = [
    "assets/images/onboarding1.png",
    "assets/images/onboarding2.png",
    "assets/images/onboarding3.png",
  ];

  void _nextPage() {
    if (_currentIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      context.push(AppRoutes.createAccountIntroScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBG,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: titles.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          images[index],
                          height: 200.h,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 40.h),
                        CommonText(
                          titles[index],
                          size: 22,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          maxline: 3,
                        ),
                      ],
                    );
                  },
                ),
              ),

              /// Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  titles.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    height: 8.h,
                    width: _currentIndex == index ? 24.w : 8.w,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? AppColors.primary
                          : AppColors.primary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30.h),

              /// Next Button
              CommonButton(
                _currentIndex == 2 ? "Get Started" : "Next",
                textalign: TextAlign.center,
                onTap: _nextPage,
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
