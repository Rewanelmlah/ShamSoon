import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/Authentication/presentation/views/login.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/Custome_google_button.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/customtextformfield.dart';
import 'package:shamsoon/features/home/presentation/views/layout_view.dart';

import '../../../../core/core_widgets/custome_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Image.asset(
                  'assets/images/LOGO-png1_2.png',
                  height: 100.h,
                  width: 100.w,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(hintText: "Enter your Name"),
              SizedBox(height: 15.h),
              CustomTextFormField(hintText: "Enter your Email"),
              SizedBox(height: 15.h),
              CustomTextFormField(
                hintText: "Enter your password",
                obscureText: true,
                suffixIcon: Icons.visibility,
                onSuffixIconPressed: () {
                  print("Toggle password visibility");
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                hintText: "Confirm your password",
                obscureText: true,
                suffixIcon: Icons.visibility,
                onSuffixIconPressed: () {
                  print("Toggle password visibility");
                },
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LayoutScreen()),
                  );
                },
                text: 'Sign In',
              ),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Text(
                      "or",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),
              SizedBox(height: 20.h),
              CustomeGoogleButton(onPressed: () {}),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Do you have an account? ",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn()),
                      );
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
