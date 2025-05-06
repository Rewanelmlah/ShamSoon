import 'package:equatable/equatable.dart';
import 'package:shamsoon/features/home/data/data_source/models/carbon.dart';

import '../../../../core/shared/base_state.dart';

final class HomeState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final Carbon? carbon;

  const HomeState({
    required this.baseStatus,
    this.msg = '',
    this.carbon
  });

  factory HomeState.initial() => const HomeState(
    baseStatus: BaseStatus.initial,
    msg: '',
    carbon: null
  );

  HomeState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    Carbon? carbon
  }) =>  HomeState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    carbon: carbon ?? this.carbon
  );

  @override
  List<Object?> get props => [
    baseStatus,
    carbon,
    msg,
  ];
}