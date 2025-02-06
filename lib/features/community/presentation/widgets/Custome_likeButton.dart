import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Container(
        padding: EdgeInsets.all(6.w),

        child: Icon(
          Icons.favorite_outline,
          size: 20.sp,
          color: isLiked ? Colors.red : AppColors.primaryColor,
        ),
      ),
    );
  }
}
