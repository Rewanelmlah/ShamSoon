import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart'; // استيراد مكتبة ScreenUtil

class CurvedChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h, // استخدام ScreenUtil للتحجيم
      width: 450.w, // استخدام ScreenUtil للتحجيم
      padding: EdgeInsets.all(25.w), // تعديل الحواف باستخدام ScreenUtil
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 40),
                FlSpot(1, 50),
                FlSpot(2, 100),
                FlSpot(3, 170),
                FlSpot(4, 150),
                FlSpot(5, 140),
                FlSpot(6, 135),
              ],
              isCurved: true,
              color:AppColors.primaryColor,
              barWidth: 5.w, // استخدام ScreenUtil لسمك الخط
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [Colors.green.withOpacity(0.3), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.w, // المسافة بين الأرقام باستخدام ScreenUtil
                getTitlesWidget: (value, _) {
                  if ([0, 50, 100, 150, 200].contains(value.toInt())) {
                    return Text(
                      "${value.toInt()}k",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold), // استخدام ScreenUtil لحجم الخط
                    );
                  }
                  return SizedBox(); // إخفاء القيم غير المطلوبة
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.w, // المسافة بين العناوين السفلية باستخدام ScreenUtil
                interval: 1, // عرض كل يوم بدون تكرار
                getTitlesWidget: (value, _) {
                  List<String> labels = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
                  int index = value.toInt();
                  if (index >= 0 && index < labels.length) {
                    return Text(
                      labels[index],
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold), // استخدام ScreenUtil لحجم الخط
                    );
                  }
                  return SizedBox(); // إخفاء القيم غير الموجودة
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false), // إخفاء الحدود
          clipData: FlClipData.all(), // يمنع خروج أي عنصر خارج الكونتينر
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            horizontalInterval: 50, // خطوط الشبكة عند 50، 100، 150، 200
          ),
          minY: 0,
          maxY: 220, // تعيين الحد الأقصى ليتناسب مع القيم الجديدة
        ),
      ),
    );
  }
}
