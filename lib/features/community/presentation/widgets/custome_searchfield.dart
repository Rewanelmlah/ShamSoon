import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
class SearchFeiled extends StatelessWidget {
  const SearchFeiled({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search, color: AppColors.primaryColor, size: 20.sp),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color:AppColors.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.r),
                  borderSide: BorderSide(color:AppColors.primaryColor, width: 2.5.w),
                ),
              ),
            );
  }
}