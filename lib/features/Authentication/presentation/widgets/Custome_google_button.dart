import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';


class CustomeGoogleButton extends StatelessWidget {
  const CustomeGoogleButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      child: OutlinedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          "assets/images/google 2.png",
          height: 22.h,
          width: 22.w,
        ),
        label: Text(
          "Sign Up With Google",
          style: TextStyle(color: Colors.grey[600], fontSize: 15.sp),
        ),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.primaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.r),
          ),
        ),
      ),
    );
  }
}
