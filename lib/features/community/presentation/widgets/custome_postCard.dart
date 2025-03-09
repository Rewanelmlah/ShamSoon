import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/community/presentation/widgets/Custome_likeButton.dart';
class CustomePostCard extends StatelessWidget {
  const CustomePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
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
                          GestureDetector(
  onTap: () {
   // Navigator.push(
   //   context,
   //   MaterialPageRoute(builder: (context) => NextPage()), // استبدل NextPage بالصفحة التي تريد التنقل إليها
   // );
  },
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      LikeButton(),
      SizedBox(width: 25.w),
      Icon(Icons.comment_outlined, size: 18.sp, color: AppColors.primaryColor),
      SizedBox(width: 4.w),
      Text('replies', style: TextStyle(fontSize: 14.sp)),
    ],
  ),
)
                          
                        ],
                      ),
                    ),
                  );
  }
}