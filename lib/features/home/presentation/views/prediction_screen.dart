import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/home/presentation/cubit/predict_cubit.dart';
import 'package:shamsoon/features/home/presentation/cubit/predict_state.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

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
        child: BlocBuilder<PredictCubit, PredictState>(
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.w),
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.r),
                  child: state.selectedImage != null? Image.file(
                    state.selectedImage!,
                    height: 300.h,
                    width: 0.8.sw,
                    fit: BoxFit.cover,
                  ) : null,
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
                        text: state.predictionStatus,
                        style: TextStyle(fontSize: 22.sp, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}