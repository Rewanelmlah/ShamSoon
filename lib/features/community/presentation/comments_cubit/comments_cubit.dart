import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shamsoon/core/widgets/easy_pagination.dart';
import 'package:shamsoon/features/community/data/data_source/comments_data_source.dart';
import 'package:shamsoon/features/community/data/models/comments.dart';
import '../../../../core/shared/base_state.dart';
import 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsState.initial());

  final CommentsDataSource commentsDataSource = CommentsDataSourceImpl();

  EasyPaginationController<PostComment> controller = EasyPaginationController();

  Future<void> createComment({
    required String postId,
    required String content
})async{
    controller.addItem(PostComment(content: content, postId: int.parse(postId)));
    final result = await commentsDataSource.createComment(
        postId: postId,
        content: content
    );
    result.when(
        (success) {
          emit(state.copyWith(
              baseStatus: BaseStatus.success,
              msg: success.message
          ));
        },
        (error) => emit(state.copyWith(
            baseStatus: BaseStatus.error,
            msg: error.message
        ))
    );
  }
}
