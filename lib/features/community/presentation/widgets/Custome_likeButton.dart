import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/widgets/app_text.dart';
import 'package:shamsoon/features/community/presentation/posts_cubit.dart';

class LikeButton extends StatefulWidget {
  final int postId;
  final int likesCount;

  const LikeButton({super.key, required this.postId, required this.likesCount});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLiked) {
          context.read<PostsCubit>().unLikePost(widget.postId.toString());
        } else {
          context.read<PostsCubit>().like(widget.postId.toString());
        }
        setState(() {
          isLiked = !isLiked;
        });
      },
      child: Container(
        padding: EdgeInsets.all(6.w),
        child: Row(
          children: [
            Icon(
              Icons.favorite_outline,
              size: 20.sp,
              color: isLiked ? Colors.red : AppColors.primaryColor,
            ),
            if(widget.likesCount > 0)
              AppText(widget.likesCount.toString()),
          ],
        ),
      ),
    );
  }
}
