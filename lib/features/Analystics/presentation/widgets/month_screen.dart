import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/Analystics/presentation/views/details_graphs.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/custome_circlechart.dart';
class MonthScreen extends StatelessWidget {
  const MonthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: Column(
        children: [
           SizedBox(height: 10.h,),
           Text(
            'Average Energy generated in month ',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 50.h),
          CircularChart(title:"kwh/month", value: "820"),
          SizedBox(height: 70.h),
         SizedBox(
        width: 300.w,
        height: 60.h,
        child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
      ),
      child: Text(
        "Show details graphs",
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsGraphs()), 
        );
      },
        ),
      ),
      
      Spacer(),
      
        ],
      ),
    );
  }
}