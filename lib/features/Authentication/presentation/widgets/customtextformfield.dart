import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';


class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final VoidCallback? onSuffixIconPressed;

  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.onSuffixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 13.sp, // Responsive font size
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: Colors.grey,
                  size: 20.r, // Responsive icon size
                ),
                onPressed: onSuffixIconPressed,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: 13.h, // Responsive vertical padding
          horizontal: 15.w, // Responsive horizontal padding
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r), // Responsive radius
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 3.w),
        ),
      ),
    );
  }
}
