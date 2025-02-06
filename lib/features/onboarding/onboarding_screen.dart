import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/core_widgets/custome_button.dart';
import 'package:shamsoon/features/Authentication/presentation/views/login.dart';
import 'package:shamsoon/features/onboarding/data/static_data.dart';
import 'package:shamsoon/features/onboarding/presentation/widgets/Skip_Button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              // Skip Button
              SkipButton(),
              // PageView
              Expanded(
                flex: 4,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onBoardingList.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) => Column(
                    children: [
                      SizedBox(height: 80.h),
                      Image.asset(
                        onBoardingList[i].image!,
                        height: 250.h,
                        width: 320.w,
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Padding(
                          padding:  EdgeInsets.all(17.0.r),
                          child: Text(
                            onBoardingList[i].body!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.h,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Section
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    // Page Indicator
                    SmoothPageIndicator(
                      effect: SlideEffect(
                        spacing: 9.0.w,
                        radius: 40.0,
                        dotWidth: 8.0.w,
                        dotHeight: 8.0.h,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.w,
                        dotColor: Colors.grey,
                        activeDotColor: AppColors.primaryColor,
                      ),
                      controller: _controller, // PageController
                      count: onBoardingList.length,
                    ),
                    Spacer(),
                    // Next/Continue Button

                    CustomButton(
                      onPressed: () {
                        if (currentIndex == onBoardingList.length - 1) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => LogIn(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      text: "Next",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
