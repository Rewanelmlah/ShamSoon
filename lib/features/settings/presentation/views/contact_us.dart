import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/settings/presentation/widgets/custome_tile.dart';


class ContactUsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
    onPressed: () {
      Navigator.pop(context);
          
    },
    icon: Icon(Icons.arrow_back_ios,size: 24.sp,),
      ),
        title: Text("Contact Us", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold))),
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
             Container(
      width: double.infinity,
      height: 70.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('ShamSoon Make Sun Works For You',style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.black),),
        ],
      ),
             ),
             SizedBox(height: 30.h),
             Center(child: Text("Contact Us Through",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: AppColors.primaryColor),)),
             SizedBox(height: 20.h),
            CustomTile(
              color: Color(0xFFBFDDD7),
              icon: Icons.mail_outline,
              title: "ShamSoon@gmail",
               onTap: () {}
          
            ),
            SizedBox(height: 20.h),
            
            CustomTile(
              color: Color(0xFFBFDDD7),
              icon: Icons.public_outlined,
              title: "Social media",
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            
          ],
        ),
      ),
    );
  }
}