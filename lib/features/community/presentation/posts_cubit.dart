import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:shamsoon/core/shared/base_state.dart';
import 'package:shamsoon/features/community/data/data_source/posts_data_source.dart';
import 'package:shamsoon/features/community/presentation/posts_state.dart';

import '../../../core/widgets/easy_pagination.dart';
import '../data/models/post.dart';


class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsState.initial());

  final PostsDataSource dataSource = PostsDataSourceImpl();

  Future<void> createPost({required String newTitle, required String content})async{
    final result = await dataSource.createPost(newTitle: newTitle, content: content);
    result.when(
          (success) => emit(state.copyWith(
            baseStatus: BaseStatus.success,
            msg: success.message,
            newPost: success.data
          )),
          (error) => emit(state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          )),
    );
  }
  EasyPaginationController<Post> controller = EasyPaginationController<Post>();

  Future<void> deletePost(Post post, int index)async{
    log('changeddddd');
    controller.removeItem(post);
    final result = await dataSource.deletePost('post.id.toString()');
    result.when(
          (success) => emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message
          )),
          (error) {
            controller.addItemAt(post, index);
            emit(state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message
            ));
          },
    );
  }

  Future<void> updatePost({
    required String postId,
    required String newTitle,
    required String content,
  })async{
    final result = await dataSource.updatePost(
        newTitle: newTitle,
        content: content,
        postId: postId
    );
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> like(String postId)async{
    final result = await dataSource.likePost(postId);
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }

  Future<void> unLikePost(String postId)async{
    final result = await dataSource.unLikePost(postId);
    result.when(
          (success) => emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message
      )),
          (error) => emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message
      )),
    );
  }
}