import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';


class CustomTextField extends StatelessWidget {
  final IconData icon;
  final IconData sufficon;
  final String label;
  final String initialValue;
  final bool obscureText;
  final Color color;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    required this.initialValue,
    this.obscureText = false, required this.color, required this.sufficon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: SizedBox(
        width: 0.9.sw,
        child: TextFormField(
          initialValue: initialValue,
          obscureText: obscureText,
          style: TextStyle(fontSize: 16.sp),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 2.w,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
            suffixIcon: Icon(sufficon,color:Colors.black,size: 24.sp,),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                 width: 40.w,
              height: 70.h,
              decoration: BoxDecoration(
                color:color,
                shape: BoxShape.circle,
              ),
                
                child: Icon(icon, color:AppColors.primaryColor, size: 32.sp)),
            ),
            labelText: label,
            labelStyle: TextStyle(color:Colors.black, fontSize:20.sp,fontWeight: FontWeight.bold),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:AppColors.primaryColor,
                width: 2.5.w,
              ),
              borderRadius: BorderRadius.circular(16.r),
            ),
          ),
        ),
      ),
    );
  }
}
