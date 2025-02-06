import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
class CustomeDayContainer extends StatelessWidget {
  const CustomeDayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.all(8.w),
          height: 70.h, // تحديد الارتفاع
          width: double.infinity, // العرض يملأ الشاشة
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(18.r), // تدوير الحواف
          ),
          child: Padding(
            padding: EdgeInsets.all(6.w), // padding داخل الحاوية الرئيسية
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // توزيع متساوي للعناصر
              children: [
                Container(
                  height: 50.h, // تحديد الارتفاع
                  width: 100.w, // تحديد العرض
                   decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(18.r), // تدوير الحواف
          ),
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
                // اللون الرصاصي
                Container(
                  height: 50.h,
                  width: 100.w,
                  decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(18.r), // تدوير الحواف
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
            borderRadius: BorderRadius.circular(18.r), // تدوير الحواف
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