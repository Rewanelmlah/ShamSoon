import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/custome_circlechart.dart';
class DetailsGraphs extends StatelessWidget {
  const DetailsGraphs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
         leading: IconButton(
    onPressed: () {
     Navigator.pop(context);    
    },
    icon: Icon(Icons.arrow_back_ios,size: 18.sp,color: Colors.white,),
      ),
       title:Text("Details On Graphs",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.white),),),
     body: Column(children: [
      SizedBox(height: 40.h,),
     Container(
  height: 280.h, 
  width: double.infinity, 
  child: Padding(
    padding: EdgeInsets.all(25.w),
    child: BarChart(
      BarChartData(
        maxY: 1000,
        barGroups: [
          BarChartGroupData(x: 0, barRods: [BarChartRodData(toY:800, width: 25.w, gradient: _greenGradient())]),
          BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 600, width: 25.w, gradient: _greenGradient())]),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 950,
                width: 27.w,
                gradient: LinearGradient(
                  colors: [Colors.orange, AppColors.primaryColor],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ],
          ),
          BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 800, width: 25.w, gradient: _greenGradient())]),
          BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 600, width: 25.w, gradient: _greenGradient())]),
          BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 400, width: 25.w, gradient: _greenGradient())]),
        ],
        titlesData: FlTitlesData(
      leftTitles: AxisTitles(
  sideTitles: SideTitles(
    showTitles: true,
    reservedSize: 50.w,
    interval: 200, 
    getTitlesWidget: (value, _) {
      int intValue = value.toInt();

      
      if ([200, 400, 600,800,1000].contains(intValue)) {
        return Text(
          "$intValue ", 
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
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
              getTitlesWidget: (value, _) {
                List<String> labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"];
                return value.toInt() < labels.length
                    ? Padding(
                        padding: EdgeInsets.all(8.w),
                        child: Text(
                          labels[value.toInt()],
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                        ),
                      )
                    : SizedBox();
              },
            ),
          ),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        gridData: FlGridData(show: true, drawVerticalLine: false), // إضافة خطوط أفقية لمساعدة القراءة
      ),
    ),
  ),
),
SizedBox(height: 20.h,),
CircularChart(title: "increase", value: "12%"),
Spacer(),

     ],),
    );
  }
}

 LinearGradient _greenGradient() {
    return LinearGradient(
      colors: [AppColors.primaryColor, Colors.green.shade700],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );
  }
