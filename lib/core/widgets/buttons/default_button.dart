import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/color_manager.dart';
import '../../helpers/constant_manager.dart';

class DefaultButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Widget? customChild;
  final bool isFitted;

  const DefaultButton({
    super.key,
    this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.elevation,
    this.customChild,
    this.isFitted = true,
  });

  Widget get _defaultChild => Text(
        title ?? 'Click!',
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontSize ?? 16.sp,
          fontFamily: fontFamily,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 4.h,
          ),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 60.sp,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              splashFactory: InkRipple.splashFactory,
              surfaceTintColor: color ?? AppColors.primaryColor,
              foregroundColor: color ?? AppColors.primaryColor,
              backgroundColor: color ?? AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    borderRadius ?? BorderRadius.circular(10.r),
                side: borderColor != null
                    ? BorderSide(
                        color: borderColor ?? AppColors.primaryColor,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
              elevation: elevation ?? ConstantManager.zeroAsDouble,
            ),
            child: isFitted
                ? FittedBox(child: customChild ?? _defaultChild)
                : customChild ?? _defaultChild),
      ),
    );
  }
}
