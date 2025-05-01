import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/core_widgets/custome_button.dart';
import 'package:shamsoon/features/Authentication/presentation/views/Successed_verify.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/customtextformfield.dart';
import 'package:shamsoon/features/home/presentation/views/layout_view.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => SuccessedVerify()));
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
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Create A New Password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    hintText: "Enter New Password",
                    obscureText: true,
                    suffixIcon: Icons.visibility,
                    onSuffixIconPressed: () {
                      print("Toggle password visibility");
                    },
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    hintText: "Confirm Your Password",
                    obscureText: true,
                    suffixIcon: Icons.visibility,
                    onSuffixIconPressed: () {
                      print("Toggle password visibility");
                    },
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LayoutScreen()),
                      );
                    },
                    text: 'Log In',
                  ),
                ])),
      ),
    );
  }
}
