import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/community/presentation/widgets/Custome_likeButton.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_addpost_putton.dart';
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
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 3,
                    shadowColor: Colors.grey.withOpacity(0.3),
                    child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.primaryColor, width: 2.w),
                                ),
                                child: CircleAvatar(
                                  radius: 24.r,
                                  backgroundImage: AssetImage('assets/images/logo.png'),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Text(
                                  "What's the best way to clean solar panels to maintain their efficiency?",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LikeButton(),
                              SizedBox(width: 25.w),
                              Icon(Icons.comment_outlined, size: 18.sp,color:AppColors.primaryColor,),
                              SizedBox(width: 4.w),
                              Text('22 replies', style: TextStyle(fontSize: 14.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
        ],
      ),
    );
  }
}

