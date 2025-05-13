import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/extensions/padding_extension.dart';
import 'package:shamsoon/features/notifications/presentation/views/notification_screen.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
        ),
        child: CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
      ).paddingAll(5),
      // centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back !',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          Text(
            'Make the sun works for you.',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            size: 20.sp,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
        ),
        IconButton(
          icon: Icon(
            Icons.calendar_month,
            size: 20.sp,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen()));
          },
        ),
      ],
    ).paddingTop(10);
  }
}