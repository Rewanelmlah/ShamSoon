import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_colors.dart';
import '../../helpers/constant_manager.dart';
import 'custom_animated_button.dart';

class LoadingButton extends StatelessWidget {
  final String title;
  final Future<void> Function() onTap;
  final Color? textColor;
  final Color? color;
  final BorderSide borderSide;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const LoadingButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderSide = BorderSide.none,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 10.h,
          ),
      child: CustomAnimatedButton(
        onTap: onTap,
        width: width ?? MediaQuery.sizeOf(context).width,
        minWidth: 50.w,
        height: height ?? 50.sp,
        color: color ?? AppColors.primaryColor,
        borderRadius: borderRadius ?? 40.sp,
        disabledColor: color ?? AppColors.primaryColor,
        borderSide: borderSide,
        loader: const CupertinoActivityIndicator(
          color: Colors.white,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: ConstantManager.fontFamily,
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 14.sp,
          ),
        ),
      ),
    );
  }
}
