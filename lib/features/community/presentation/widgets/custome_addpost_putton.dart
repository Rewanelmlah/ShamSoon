import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key});

  @override
  Widget build(BuildContext context) { // success
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:AppColors.primaryColor, width: 2.w),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Icon(Icons.add_box_outlined, color: AppColors.primaryColor, size: 24.sp),
    );
  }
}