
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/Custome_day_barchart.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/month_screen.dart';
import 'package:shamsoon/features/Analystics/presentation/widgets/week_screen.dart';

class EnergyDashboard extends StatefulWidget {
  @override
  _EnergyDashboardState createState() => _EnergyDashboardState();
}

class _EnergyDashboardState extends State<EnergyDashboard> {
  String selectedPeriod = "Day"; // افتراضيًا يومي

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        
        children: [
          SizedBox(height: 70.h,),
          // أزرار التبديل (يوم - أسبوع - شهر)
          Padding(
            padding:  EdgeInsets.all(10.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ["Day", "Week", "Month"].map((period) {
                bool isSelected = period == selectedPeriod;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPeriod = period;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 30.w),
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryColor: Color(0xFF489A88),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Text(
                      period,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 10.h),

          // الرسومات البيانية حسب الفترة المختارة
          if (selectedPeriod == "Day") ...[
            Expanded(child: CustomeBarChartSample()),
          ] else if (selectedPeriod == "Week") ...[
            Expanded(child: WeekScreen()),
          ] else if (selectedPeriod == "Month") ...[
            Expanded(child: MonthScreen()),
          ]
        ],
      ),
    );
  }
}