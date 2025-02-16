import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/home/presentation/views/camera_screen.dart';

class UploadphotoCard extends StatelessWidget {
  const UploadphotoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => CameraScreen()),
                 );

      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color:AppColors.primaryColor, width: 2.w),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SizedBox(
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check your panel condition",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Open Camera/Upload photo",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.upload_file_outlined,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
