import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:shamsoon/core/app_colors.dart';

class PredictionScreen extends StatelessWidget {
  final String imagePath;

  const PredictionScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, size: 22.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Prediction',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w), 
        child: Column(
           
          crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            SizedBox(height: 30.h), 
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 3.w),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r), 
                child: Image.file(
                  File(imagePath),
                  height: 300.h, 
                  width: 0.8.sw, 
                  fit: BoxFit.cover, 
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Container(
              padding: EdgeInsets.all(20.w), 
              decoration: BoxDecoration(
                border: Border.all(color:AppColors.primaryColor, width: 3.w),
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Your solar panel is: ',
                  style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'dusty',
                      style: TextStyle(fontSize: 22.sp, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}