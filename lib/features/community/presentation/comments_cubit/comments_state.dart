import 'package:equatable/equatable.dart';

import '../../../../core/shared/base_state.dart';

final class CommentsState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;

  const CommentsState({
    required this.baseStatus,
    this.msg = '',
  });

  factory CommentsState.initial() => const CommentsState(
    baseStatus: BaseStatus.initial,
  );

  CommentsState copyWith({
    BaseStatus? baseStatus,
    String? msg,
  }) =>  CommentsState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
  );

  @override
  List<Object?> get props => [
    baseStatus,
    msg,
  ];
}