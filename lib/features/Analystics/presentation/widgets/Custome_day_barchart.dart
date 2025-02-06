import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/Custome_daycontainer.dart';

class CustomeBarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Energy generated on day',
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40.h),
        Container(
          
          height: 300.h, // الحجم بالنسبة لحجم الشاشة
          width: 400.w, // العرض بالنسبة لحجم الشاشة
          child: Padding(
            padding: EdgeInsets.all(17.w), // المسافة (padding) تتناسب مع العرض
            child: BarChart(
              BarChartData(
                barGroups: [
                  BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(
                            toY: 8,
                            width: 30.w,
                            gradient: _greenGradient())
                      ]),
                  BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                            toY: 18,
                            width: 30.w,
                            gradient: _greenGradient())
                      ]),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(
                        toY: 25,
                        width: 32.w,
                        gradient: LinearGradient(
                          colors: [Colors.orange, AppColors.primaryColor],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ],
                  ),
                  BarChartGroupData(
                      x: 3,
                      barRods: [
                        BarChartRodData(
                            toY: 20,
                            width: 30.w,
                            gradient: _greenGradient())
                      ]),
                  BarChartGroupData(
                      x: 4,
                      barRods: [
                        BarChartRodData(
                            toY: 15,
                            width: 30.w,
                            gradient: _greenGradient())
                      ]),
                  // BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 10, width: 30.w, gradient: _greenGradient())]),
                  BarChartGroupData(
                      x: 6,
                      barRods: [
                        BarChartRodData(
                            toY: 5,
                            width: 30.w,
                            gradient: _greenGradient())
                      ]),
                ],
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 60.w, // المسافة بين الأرقام
                      getTitlesWidget: (value, _) {
                        return Text(
                          "${value.toInt()} kWh",
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ); // الحجم يتناسب مع الشاشة
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 50.w, // المسافة بين العناوين السفلية
                      getTitlesWidget: (value, _) {
                        List<String> labels = ["8:0", "10:0", "12:0", "2:0", "4:0", "6:0", "8:0"];
                        return Padding(
                          padding: EdgeInsets.all(16.w), // المسافة بين النصوص والعناوين السفلية
                          child: Text(labels[value.toInt()],
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
              ),
            ),
          ),
        ),
    
        CustomeDayContainer(),
        Spacer()
      ],
    );
  }

  LinearGradient _greenGradient() {
    return LinearGradient(
      colors: [AppColors.primaryColor, Colors.green.shade700],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
}
