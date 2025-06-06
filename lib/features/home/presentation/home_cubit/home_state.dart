import 'package:equatable/equatable.dart';
import 'package:shamsoon/features/home/data/data_source/models/carbon.dart';
import 'package:shamsoon/features/home/data/data_source/models/get_solar_panel_response.dart';

import '../../../../core/shared/base_state.dart';

final class HomeState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final Carbon? carbon;
  final GetSolarPanelResponse? solarPanel;

  const HomeState({
    required this.baseStatus,
    this.msg = '',
    this.solarPanel,
    this.carbon
  });

  factory HomeState.initial() => const HomeState(
    baseStatus: BaseStatus.initial,
    msg: '',
    carbon: null,
    solarPanel: null
  );

  HomeState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    Carbon? carbon,
    GetSolarPanelResponse? solarPanel
  }) =>  HomeState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    carbon: carbon ?? this.carbon,
    solarPanel: solarPanel ?? this.solarPanel
  );

  @override
  List<Object?> get props => [
    baseStatus,
    solarPanel,
    carbon,
    msg,
  ];
}