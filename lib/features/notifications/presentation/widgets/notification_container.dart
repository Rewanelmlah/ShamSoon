import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';

class CustomNotificationTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomNotificationTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp,),
        ),
        trailing: Icon(
          Icons.delete,
          size: 14.sp,
          color: Colors.red,
        ),
        onTap: onTap,
      ),
    );
  }
}
