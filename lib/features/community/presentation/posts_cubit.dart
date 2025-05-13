import 'package:flutter_bloc/flutter_bloc.dart';
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
    controller.removeItem(post);
    emit(state.copyWith(baseStatus: BaseStatus.loading));
    final result = await dataSource.deletePost(post.id.toString());
    result.when(
          (success) => emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message
          )),
          (error) {
            controller.addItemAt(index, post);
            emit(state.copyWith(
                baseStatus: BaseStatus.error,
                msg: error.message
            ));
          },
    );
  }

  Future<void> updatePost({
    required Post post,
    required String newTitle,
    required String content,
    required int index,
  }) async {
    final originalPost = post.copyWith(); // Make a snapshot copy
    // Now safe to mutate controller's item
    controller.accessElement(index)?.content = content;

    final result = await dataSource.updatePost(
      newTitle: newTitle,
      content: content,
      postId: post.id.toString(),
    );

    result.when(
          (success) {
        emit(state.copyWith(
          baseStatus: BaseStatus.success,
          msg: success.message,
        ));
      },
          (error) {
        controller.accessElement(index)?.content = originalPost.content;
        controller.refresh();
        emit(state.copyWith(
          baseStatus: BaseStatus.error,
          msg: error.message,
        ));
      },
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