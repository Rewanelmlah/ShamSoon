import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/helpers/constant_manager.dart';
import 'package:shamsoon/core/network/api_endpoints.dart';
import 'package:shamsoon/core/network/network_request.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/features/community/data/models/comments.dart';

import '../../../../core/helpers/global_variables.dart';
import '../../../../core/network/network_service.dart';

abstract interface class CommentsDataSource{
  Future<BaseModel<CommentsResponse>> getAllComments(String postId);
  Future<Result<BaseModel<PostComment>, Failure>> createComment({
    required String postId,
    required String content
});

  Future<Result<BaseModel, Failure>> deleteComment({
    required String postId,
    required String content,
    required String commentId
  });
}

class CommentsDataSourceImpl implements CommentsDataSource{
  
  final NetworkService networkService = sl<NetworkService>(instanceName: ConstantManager.dioService);
  @override
  Future<Result<BaseModel<PostComment>, Failure>> createComment({required String postId, required String content}) async{
    final result = await networkService.callApi(
        NetworkRequest(
            method: RequestMethod.post,
            path: '${ApiConstants.posts}/$postId${ApiConstants.comments}',
            body: {'content' : content}
        ),
      mapper: (json) => PostComment.fromJson(json['comment']),
    ).handleCallbackWithFailure();
    return result;
  }

  @override
  Future<BaseModel<CommentsResponse>> getAllComments(String postId) async{
    final result = await networkService.callApi<CommentsResponse>(
        NetworkRequest(
            method: RequestMethod.get,
            path: '${ApiConstants.posts}/$postId${ApiConstants.comments}'
        ),
        mapper: (json) => CommentsResponse.fromJson(json),
    );

    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> deleteComment({required String postId, required String content, required String commentId}) {
    final result = networkService.callApi(
        NetworkRequest(
            method: RequestMethod.delete,
            path: '${ApiConstants.posts}/$postId${ApiConstants.comments}/$commentId'
        ),
    ).handleCallbackWithFailure();

    return result;
  }

}