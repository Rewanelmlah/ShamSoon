import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/extensions/padding_extension.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/core/widgets/custom_loading.dart';
import 'package:shamsoon/features/community/data/data_source/posts_data_source.dart';
import 'package:shamsoon/features/community/data/models/post.dart';
import 'package:shamsoon/features/community/presentation/posts_cubit.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_addpost_putton.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_postCard.dart';
import 'package:shamsoon/features/community/presentation/widgets/custome_searchfield.dart';
import '../../../../core/helpers/navigation.dart';
import '../../../../core/widgets/easy_pagination.dart';
import 'Add_post_screen.dart';

class CommunityScreen extends StatefulWidget {
  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsCubit(),
      child: Builder(
        builder: (ctx) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Forum', style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold)),
              centerTitle: true,
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
                  child: Row(
                    children: [
                      const Expanded(
                          child: SearchFeiled()
                      ),
                      SizedBox(width: 8.w),
                      InkWell(
                          onTap: () async{
                            final result = await Go.to(BlocProvider.value(
                                value: ctx.read<PostsCubit>(),
                                child: AddPostScreen()
                            ));
                            if(result == 'success'){
                              log('sdojhslkdjhsd');
                              ctx.read<PostsCubit>().controller.clear();
                              setState(() {});
                            }
                          },
                          child: const AddPostButton()),
                    ],
                  ),
                ),
                EasyPagination<BaseModel<PostsResponse>, Post>.listView(
                  key: UniqueKey(),
                  asyncCall: (currentPage) => PostsDataSourceImpl().getPosts(),
                  mapper: (response) => DataListAndPaginationData(
                      data: response.data.posts,
                      paginationData: PaginationData(totalPages: 1)
                  ),
                  errorMapper: ErrorMapper(errorWhenDio: (e) => e.response?.data['message']),
                  itemBuilder: (data, index) => PostCard(post: data[index], index: index),
                  loadingBuilder: CustomLoading.showLoadingView(),
                  shrinkWrap: true,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  controller: ctx.read<PostsCubit>().controller,
                ).paddingSymmetric(horizontal: 15.w, vertical: 5.h)
              ],
            ),
          );
        }
      ),
    );
  }
}
