import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/home/presentation/widgets/battery_halfchart.dart';
import 'package:shamsoon/features/home/presentation/widgets/upload_photo_card.dart';
import 'package:shamsoon/features/home/presentation/widgets/weather_card.dart';

class PanelDetailes extends StatelessWidget {
  const PanelDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 18.sp, color: Colors.white),
        ),
        title: Text(
          "Details",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(13.w),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SizedBox(height: 10.h,),
           const CustomeHalfchart(),
            SizedBox(height: 20.h,),
          const UploadphotoCard(),
            SizedBox(height: 20.h,),
          const  WeatherCard(),
            
          ],),
        ),
      ),
    );
  }
}