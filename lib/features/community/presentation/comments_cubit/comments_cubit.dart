import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/features/community/data/data_source/comments_data_source.dart';
import 'package:shamsoon/features/community/data/models/comments.dart';
import '../../../../core/shared/base_state.dart';
import '../../../../core/widgets/easy_pagination.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsState.initial());

  final CommentsDataSource commentsDataSource = CommentsDataSourceImpl();
  EasyPaginationController<PostComment> commentsController = EasyPaginationController();

  Future<void> createComment({
    required String postId,
    required String content,
    required int index,
})async{
    commentsController.addItem(PostComment(content: content, postId: int.parse(postId)));
    final result = await commentsDataSource.createComment(
        postId: postId,
        content: content
    );
    result.when(
        (success) {
          commentsController.replaceWith(index, success.data);
          emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message
          ));
        },
        (error) {
          commentsController.removeAt(index);
          emit(state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          ));
        }
    );
  }

  Future<void> deleteComment({
    required int index,
    required PostComment comment,
})async{
    final originalComment = comment.copyWith();
    commentsController.removeAt(index);
    final result = await commentsDataSource.deleteComment(
        postId: comment.postId.toString(),
        content: comment.content!,
        commentId: comment.id.toString()
    );
    result.when(
            (success) {
          emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message
          ));
        },
            (error) {
          commentsController.addItemAt(originalComment, index);
          emit(state.copyWith(
              baseStatus: BaseStatus.error,
              msg: error.message
          ));
        }
    );
  }
}
