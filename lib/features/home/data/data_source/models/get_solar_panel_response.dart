import 'package:shamsoon/features/home/data/data_source/models/carbon.dart';

class GetSolarPanelResponse {
  double performance;
  int energyProduced;
  int energyConsumed;
  Carbon carbon;

  GetSolarPanelResponse({
    required this.performance,
    required this.energyProduced,
    required this.energyConsumed,
    required this.carbon,
  });

  factory GetSolarPanelResponse.fromJson(Map<String, dynamic> json) => GetSolarPanelResponse(
    performance: json['performance'],
    energyProduced: json['energy_produced'],
    energyConsumed: json['energy_consumed'],
    carbon: Carbon.fromJson(json['carbon']),
  );
}