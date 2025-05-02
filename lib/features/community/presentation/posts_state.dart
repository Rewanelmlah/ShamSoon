import 'package:equatable/equatable.dart';
import 'package:shamsoon/features/community/data/models/post.dart';

import '../../../core/shared/base_state.dart';

final class PostsState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final Post? newPost;

  const PostsState({
    required this.baseStatus,
    this.msg = '',
    this.newPost
  });

  factory PostsState.initial() => const PostsState(
    baseStatus: BaseStatus.initial,
    msg: '',
    newPost: null
  );

  PostsState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    Post? newPost
  }) =>  PostsState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    newPost: newPost ?? this.newPost
  );

  @override
  List<Object?> get props => [
    baseStatus,
    newPost,
    msg,
  ];
}