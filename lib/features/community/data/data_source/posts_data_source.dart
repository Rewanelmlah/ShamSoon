import 'package:multiple_result/multiple_result.dart';
import 'package:shamsoon/core/error/failure.dart';
import 'package:shamsoon/core/extensions/error_handler_extension.dart';
import 'package:shamsoon/core/network/api_endpoints.dart';
import 'package:shamsoon/core/network/network_request.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/base_model.dart';
import 'package:shamsoon/features/community/data/models/post.dart';

import '../../../../core/helpers/constant_manager.dart';
import '../../../../core/helpers/global_variables.dart';

abstract interface class PostsDataSource{
  Future<BaseModel<PostsResponse>> getPosts();
  Future<Result<BaseModel, Failure>> updatePost({
    required String postId,
    required String newTitle,
    required String content
  });
  Future<Result<BaseModel, Failure>> deletePost(String postId);
  Future<Result<BaseModel<Post>, Failure>> createPost({
    required String newTitle,
    required String content
  });
  Future<Result<BaseModel, Failure>> likePost(String postId);
  Future<Result<BaseModel, Failure>> unLikePost(String postId);
}

class PostsDataSourceImpl implements PostsDataSource{
  final NetworkService networkService = sl<NetworkService>(instanceName: ConstantManager.dioService);
  @override
  Future<BaseModel<PostsResponse>> getPosts() async{
    final result  = await networkService.callApi(
        NetworkRequest(
            method: RequestMethod.get,
            path: ApiConstants.posts
        ),
      mapper: (json) => PostsResponse.fromJson(json),
    );
    return result;
  }

  @override
  Future<Result<BaseModel<Post>, Failure>> createPost({
    required String newTitle,
    required String content
  }) async{
    final result  = await networkService.callApi(
      NetworkRequest(
        method: RequestMethod.post,
        path: ApiConstants.posts,
        body: {'title' : newTitle, 'content' : content},
      ),
      mapper: (json) => Post.fromJson(json['post']),
    ).handleCallbackWithFailure();
    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> updatePost({
    required String postId,
    required String newTitle,
    required String content
})async {
    final result  = await networkService.callApi(
      NetworkRequest(
        method: RequestMethod.put,
        path: ApiConstants.posts+postId,
        body: {'title' : newTitle, 'content' : content},
      ),
      mapper: (json) => Post.fromJson(json['post']),
    ).handleCallbackWithFailure();

    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> deletePost(String postId) async{
    final result  = await networkService.callApi(
      NetworkRequest(
        method: RequestMethod.delete,
        path: ApiConstants.posts+postId,
      ),
    ).handleCallbackWithFailure();
    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> likePost(String postId) async{
    final result  = await networkService.callApi(
      NetworkRequest(
        method: RequestMethod.post,
        path: '${ApiConstants.posts}$postId/like',
      ),
    ).handleCallbackWithFailure();
    return result;
  }

  @override
  Future<Result<BaseModel, Failure>> unLikePost(String postId)async {
    final result  = await networkService.callApi(
      NetworkRequest(
        method: RequestMethod.post,
        path: '${ApiConstants.posts}/$postId/unlike',
      ),
    ).handleCallbackWithFailure();
    return result;
  }

}