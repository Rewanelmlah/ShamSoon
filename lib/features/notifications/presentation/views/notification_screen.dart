import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/notifications/presentation/widgets/notification_container.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 24.sp),
        ),
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomNotificationTile(title: 'Your panel needs cleaning!', onTap: () {}),
              SizedBox(height: 20.h),
              CustomNotificationTile(title: 'Maintenance time has come', onTap: () {}),
              SizedBox(height: 20.h),
              CustomNotificationTile(title: 'Your battery is fully charged', onTap: () {}),
              SizedBox(height: 20.h),
              CustomNotificationTile(title: 'You are reducing CO2', onTap: () {}),
              SizedBox(height: 20.h),
              CustomNotificationTile(title: 'High temperature detected', onTap: () {}),
              SizedBox(height: 20.h),
              CustomNotificationTile(title: 'An issue has been detected', onTap: () {}),
              SizedBox(height: 20.h),
              
            ],
          ),
        ),
      ),
    );
  }
}