import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/features/community/presentation/posts_cubit.dart';

import '../posts_state.dart';


class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  // final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, size: 18.sp, color: Colors.white),
        ),
        title: Text(
          "New Post",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
  
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "What would you like to share?",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15.h),
            TextField(
              controller: contentController,
              maxLines: 8,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide: BorderSide(color: AppColors.primaryColor, width: 2.5.w),
                ),
                hintText: "Write your post here...",
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BlocListener<PostsCubit, PostsState>(
                  listener: (context, state) => Helpers.manageBlocConsumer(
                      state.baseStatus,
                      msg: state.msg,
                      actionWhenSuccess: () => Navigator.pop(context, 'success')
                  ),
                  child: LoadingButton(onTap: ()async=> await context.read<PostsCubit>().createPost(
                      newTitle: 'New post', content: contentController.text
                  ), width: 120.w, height: 40.h, title: "Post",),
                ),
                SizedBox(width: 20.w),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 12.h),
                  ),
                  child: Text("Cancel", style: TextStyle(fontSize: 16.sp, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
