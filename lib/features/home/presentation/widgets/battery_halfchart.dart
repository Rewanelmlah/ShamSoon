import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';

class CustomeHalfchart extends StatelessWidget {
  const CustomeHalfchart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primaryColor, width: 2.w),
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30.h),
            SizedBox(
              height: 150.h,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xffEF1E39),
                          value: 20,
                          radius: 20.w,
                          title: '',
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          color: const Color(0xffF77522),
                          value: 20,
                          radius: 20.w,
                          title: '',
                          showTitle: false,
                        ),
                           PieChartSectionData(
                          color: Colors.green,
                          value: 20,
                          radius: 20.w,
                          title: '',
                          showTitle: false,
                        ),
                        PieChartSectionData(
                          color: Colors.grey,
                          value: 20,
                          radius: 20.w,
                          title: '',
                          showTitle: false,
                        ),
                        PieChartSectionData(
                         color: Colors.transparent,
                          value: 50,
                          radius: 20.w,
                          title: '',
                          showTitle: false,
                        ),
                      ],
                      startDegreeOffset: 160,
                      centerSpaceRadius: 70.w,
                      sectionsSpace: 3,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Battery level",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "93 %",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "11.52 kw/h",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
