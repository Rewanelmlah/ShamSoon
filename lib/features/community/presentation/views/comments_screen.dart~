import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/core/widgets/custom_loading.dart';
import 'package:shamsoon/features/community/data/data_source/comments_data_source.dart';
import 'package:shamsoon/features/community/data/models/comments.dart';
import 'package:shamsoon/features/community/data/models/post.dart';
import 'package:shamsoon/features/community/presentation/comments_cubit/comments_cubit.dart';
import 'package:shamsoon/features/community/presentation/widgets/comment_widget.dart';

import '../../../../core/widgets/easy_pagination.dart';

class CommentsScreen extends StatefulWidget {
  final Post post;
  const CommentsScreen({super.key,
    required this.post
  });


  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  List<String> comments = [
    "Try using a soft brush",
    "Use a microfiber cloth for better results",
    "Avoid using harsh chemicals",
    "Use a damp microfiber cloth.",
    "Avoid direct sunlight while cleaning.",
  ];

  void addComment() {
    if (_commentController.text.isNotEmpty) {
      // setState(() {
        // comments.add(_commentController.text);
        // _commentController.clear();
      // });
    }
  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommentsCubit(),
      child: Builder(
        builder: (ctx) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              centerTitle: true,
              title: Text(
                "Replies",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.all(5.w),
              child: EasyPagination<BaseModel<CommentsResponse>, PostComment>.listView(
                loadingBuilder: CustomLoading.showLoadingView(),
                controller: ctx.read<CommentsCubit>().commentsController,
                shrinkWrap: true,
                asyncCall: (currentPage) async => await CommentsDataSourceImpl().getAllComments(widget.post.id.toString()),
                mapper: (response) => DataListAndPaginationData(
                  data: response.data.comments,
                  paginationData: PaginationData(
                    totalPages: response.data.totalPagesNumber
                  )
                ),
                errorMapper: ErrorMapper(errorWhenDio: (e) => e.response?.data['message']),
                itemBuilder: (data, index) => CommentWidget(
                    post: widget.post,
                    comments: data,
                    index: index
                )
              ),
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.all(20.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      style: TextStyle(fontSize: 14.sp),
                      decoration: InputDecoration(
                        hintText: "Add Comment ...",
                        hintStyle: TextStyle(fontSize: 12.sp, color: AppColors.primaryColor),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r),
                          borderSide: BorderSide(color: AppColors.primaryColor, width: 2.w),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  IconButton(
                    icon: Icon(Icons.send, color: AppColors.primaryColor, size: 22.sp),
                    onPressed: () {
                      ctx.read<CommentsCubit>().createComment(
                        postId: widget.post.id.toString(),
                        content: _commentController.text,
                        index: ctx.read<CommentsCubit>().commentsController.items.value.length
                      );
                      _commentController.clear();
                    }
                  ),
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
