import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/widgets/custom_loading.dart';
import 'package:shamsoon/core/widgets/custom_messages.dart';
import 'package:shamsoon/features/home/presentation/cubit/predict_cubit.dart';
import 'package:shamsoon/features/home/presentation/views/prediction_screen.dart';

class UploadphotoCard extends StatelessWidget {
  const UploadphotoCard({super.key});

  void _uploadImage(BuildContext context)async{
    final imageFile = await Helpers.getImage();
    if(context.mounted){
      _manageSelectingImage(context, image: imageFile);
    }
  }

  Future<void> _manageSelectingImage(BuildContext context, {required File? image})async{
    CustomLoading.showFullScreenLoading();
    await context.read<PredictCubit>().sendImageToAi(image);
    CustomLoading.hideFullScreenLoading();

    MessageUtils.showSimpleToast(msg: context.read<PredictCubit>().state.msg);
    Go.to(BlocProvider.value(
        value: context.read<PredictCubit>(),
        child: const PredictionScreen()
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async => _uploadImage(context),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color:AppColors.primaryColor, width: 2.w),
          borderRadius: BorderRadius.circular(25.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SizedBox(
            height: 100.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Check your panel condition",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Open Camera/Upload photo",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35.r,
                  backgroundColor: AppColors.primaryColor,
                  child: Icon(
                    Icons.upload_file_outlined,
                    color: Colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
