import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';

class CircularChart extends StatelessWidget {
  final String title;
  final String value;

  const CircularChart({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(4.w),
        width: 200.w, // Responsive width
        height: 200.h, // Responsive height
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [AppColors.primaryColor, Colors.green, Colors.red, Colors.yellow],
                  stops: [0.0, 0.33, 0.58, 1.0], // توزيع الألوان
                ).createShader(bounds);
              },
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 80, 
                      color: Colors.white,
                      radius: 20.w, 
                      title: '',
                    ),
                    PieChartSectionData(
                      value: 10,
                      color: Colors.white,
                      radius: 20.w,
                      title: '',
                    ),
                    PieChartSectionData(
                      value: 10,
                      color: Colors.white,
                      radius: 20.w,
                      title: '',
                    ),
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: 75.w, 
                ),
              ),
            ),

            
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 35.sp, 
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.sp, 
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
