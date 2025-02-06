import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';


class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65.h,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.r)),
        ),
        icon: Container(
            width: 50.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.exit_to_app, size: 24.sp, color: Colors.red)),
        label: Text("Log out", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: () {
          // تنفيذ عملية تسجيل الخروج هنا
        },
      ),
    );
  }
}

