import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
class CustomeDayContainer extends StatelessWidget {
  const CustomeDayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(10.w),
          height: 70.h,
          width: double.infinity, 
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(18.r), 
          ),
          child: Padding(
            padding: EdgeInsets.all(6.w), 
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50.h, 
                  width: 100.w, 
              decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(18.r),    ),
                  child: Column(
                    children: [
                      Text(
                        '55 KW/h',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '12:00',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(18.r),  
          ),
                  child: Column(
                    children: [
                      Text(
                        '43 KW/h',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '10:00',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(18.r),
          ),
                  child: Column(
                    children: [
                      Text(
                        '38 KW/h',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '08:00',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}