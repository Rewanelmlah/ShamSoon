import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/custome_linechart.dart';
class WeekScreen extends StatelessWidget {
  const WeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: Column(
        children: [
          Text(
            'Weekly average :120 kw/h',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          Image.asset(
            'assets/images/week.png', 
            width: 150.w, 
            height: 150.h, 
           
          ),
          
          CurvedChartSample(),
          Spacer(),
        ],
       ),
    );
  }
}