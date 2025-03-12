class Providers {
  int id;
  String? name;
  String? image;
  int? rate;
  bool isFavorite;
  List<Locations> locations;

  Providers({
    required this.id,
    required this.name,
    required this.image,
    required this.rate,
    required this.isFavorite,
    required this.locations
  });


  factory Providers.fromJson(Map<String, dynamic> json) => Providers(
    id: json['id'],
    name: json['name'],
    image: json['image'],
    rate: json['rate_avg'],
    isFavorite: json['is_favored'],
    locations: (json['locations'] as List<dynamic>?)
        ?.map((json) => Locations.fromJson(json as Map<String, dynamic>))
        .toList() ??[],
  );
}

class Locations {
  int? id;
  double? lat;
  double? lng;
  String? mapDesc;
  String? address;
  String? description;

  Locations({
    required this.id,
    required this.lat,
    required this.lng,
    required this.mapDesc,
    required this.address,
    required this.description
  });

  factory Locations.fromJson(Map<String, dynamic> json) => Locations(
    id: json['id'],
    lat: json['lat'],
    lng: json['lng'],
    mapDesc: json['map_desc'],
    address: json['address'],
    description: json['description'],
  );
}