import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';


class CustomTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const CustomTile({Key? key, required this.icon, required this.title, required this.onTap, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: ListTile(
        leading: Container(
           width: 40.w,
            height: 70.h,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          child: Icon(icon, size: 32.sp, color:AppColors.primaryColor)),
        title: Text(title, style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.arrow_forward_ios, size: 22.sp, color: Colors.grey.shade900),
        onTap: onTap,
      ),
    );
  }
}

