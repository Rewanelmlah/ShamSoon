import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/Authentication/presentation/views/login.dart';
import 'package:shamsoon/features/Authentication/presentation/views/otp_view.dart';

import '../../../../core/core_widgets/custome_button.dart';
import '../widgets/customtextformfield.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LogIn()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Enter your email account to \n      reset your password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    hintText: "Enter your Email",
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => OTPScreen()),
                      );
                    },
                    text: 'Reset Password',
                  ),
                ])),
      ),
    );
  }
}
