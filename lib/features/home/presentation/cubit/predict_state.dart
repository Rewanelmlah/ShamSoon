import 'dart:io';
import 'package:equatable/equatable.dart';
import '../../../../core/shared/base_state.dart';

final class PredictState extends Equatable {
  final BaseStatus baseStatus;
  final String msg;
  final String? predictionStatus;
  final File? selectedImage;

  const PredictState({
    required this.baseStatus,
    this.msg = '',
    this.predictionStatus,
    this.selectedImage,
  });

  factory PredictState.initial() => const PredictState(
    baseStatus: BaseStatus.initial,
    predictionStatus: '',
    selectedImage: null,
  );

  PredictState copyWith({
    BaseStatus? baseStatus,
    String? msg,
    String? predictionStatus,
    File? selectedImage
  }) =>  PredictState(
    baseStatus: baseStatus ?? this.baseStatus,
    msg: msg ?? this.msg,
    predictionStatus: predictionStatus?? this.predictionStatus,
    selectedImage: selectedImage?? this.selectedImage
  );

  @override
  List<Object?> get props => [
    baseStatus,
    selectedImage,
    predictionStatus,
    msg,
  ];
}