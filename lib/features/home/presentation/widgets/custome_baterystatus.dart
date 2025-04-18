import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/features/home/presentation/cubit/predict_cubit.dart';
import 'package:shamsoon/features/home/presentation/views/panel_details.dart';
import 'package:shamsoon/features/home/presentation/widgets/custome_gradient.dart';

class BatteryStatusCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (ctx) => BlocProvider.value(
                    value: context.read<PredictCubit>(),
                    child: const PanelDetailes()
                )),
              ),
              borderRadius: BorderRadius.circular(16.r), 
              child: Container(
                height: 300.h,
                width: 400.w,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10.r,
                      spreadRadius: 2.r,
                      offset: Offset(0, 5.h),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.charging_station, color: AppColors.primaryColor, size: 28.sp),
                            SizedBox(width: 5.w),
                            Text("Battery Status\n 90% charging", style: TextStyle(fontSize: 14.sp,)),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.cloudy_snowing, color: AppColors.primaryColor, size: 28.sp),
                            SizedBox(width: 5.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20°C Today", style: TextStyle(fontSize: 14.sp, )),
                                Text("Most cloudy", style: TextStyle(fontSize: 14.sp, )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
    
                    SizedBox(height: 40.h),
    
                  Center(
  child: Stack(
    alignment: Alignment.center,
    children: [
      CustomPaint(
        size: Size(150.w, 150.h),
        painter: GradientPieChartPainter(),
      ),
      Container(
        width: 130.w,
        height: 130.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.green.shade700, AppColors.primaryColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Energy generated", 
                style: TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.bold)),
            Text("34.5 kW/h", 
                style: TextStyle(fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.bold)),
            Text("Average", 
                style: TextStyle(fontSize: 12.sp, color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ],
  ),
),
                ]),
              ),
            );
  }
}
