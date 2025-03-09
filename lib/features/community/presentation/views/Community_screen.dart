import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/community/presentation/widgets/Custome_likeButton.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_addpost_putton.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_postCard.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_searchfield.dart';

class CommunityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         automaticallyImplyLeading: false,
        title: Text('Forum', style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
      Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
      child: Row(
        children: [
          Expanded(
            child: SearchFeiled()
          ),
          SizedBox(width: 8.w), 
         AddPostButton(),
        ],
      ),
    ),

    Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                  child: CustomePostCard()
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}

