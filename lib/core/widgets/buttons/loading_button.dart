import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app_colors.dart';
import '../../helpers/app_sizes.dart';
import 'custom_animated_button.dart';

class LoadingButton extends StatelessWidget {
  final String? title;
  final FutureOr<void> Function() onTap;
  final Color? textColor;
  final Color? color;
  final BorderSide borderSide;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final Widget? customChild;
  final FontWeight? fontWeight;

  const LoadingButton({
    super.key,
    this.title,
    this.customChild,
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
  }) : assert(title != null || customChild != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ??
          EdgeInsets.symmetric(
            horizontal: AppMargin.mW10,
            vertical: AppMargin.mH10,
          ),
      child: Center(
        child: CustomAnimatedButton(
          onTap: () async => await onTap(),
          width: width ?? MediaQuery.sizeOf(context).width,
          minWidth: AppSize.sW50,
          height: height?? 35.h,
          color: color ?? AppColors.primaryColor,
          borderRadius: borderRadius ?? AppSize.sH10,
          disabledColor: color ?? AppColors.primaryColor,
          borderSide: borderSide,
          loader: const CupertinoActivityIndicator(
            color: Colors.white,
          ),
          child: title != null
              ? Text(
            title!,
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? FontSize.s14,
                fontWeight: FontWeight.bold),
          )
              : customChild!,
        ),
      ),
    );
  }
}
