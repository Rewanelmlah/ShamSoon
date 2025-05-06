class Carbon{
  int? id;
  int? solarPanelId;
  double? co2Saved;
  double? equivalentTrees;

  Carbon({this.id, this.solarPanelId, this.co2Saved, this.equivalentTrees});

  Carbon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    solarPanelId = json['solar_panel_id'];
    co2Saved = json['co2_saved'];
    equivalentTrees = json['equivalent_trees'];
  }
}