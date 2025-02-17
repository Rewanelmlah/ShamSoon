import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart'; 

class CurvedChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h, 
      width: 450.w, 
      padding: EdgeInsets.all(28.w), 
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
              barWidth: 5.w, 
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
                reservedSize: 40.w, 
                getTitlesWidget: (value, _) {
                  if ([0, 50, 100, 150, 200].contains(value.toInt())) {
                    return Text(
                      "${value.toInt()}k",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold), 
                    );
                  }
                  return SizedBox(); 
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40.w, 
                interval: 1,
                getTitlesWidget: (value, _) {
                  List<String> labels = ["Sat", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri"];
                  int index = value.toInt();
                  if (index >= 0 && index < labels.length) {
                    return Text(
                      labels[index],
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    );
                  }
                  return SizedBox();
                },
              ),
            ),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false), 
          clipData: FlClipData.all(),
          gridData: FlGridData(
            show: true,
            drawHorizontalLine: true,
            drawVerticalLine: false,
            horizontalInterval: 50, 
          ),
          minY: 0,
          maxY: 220, 
        ),
      ),
    );
  }
}
