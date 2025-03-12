class UserData{
  int? id;
  String? name;
  int? countryCode;
  int? phone;
  int? fullNumber;
  String? image;
  List? locations;
  String? token;

  UserData({
    required this.id,
    required this.name,
    required this.countryCode,
    required this.phone,
    required this.fullNumber,
    required this.image,
    required this.locations,
    required this.token
  });

  factory UserData.initial(){
    return UserData(
        id: 0,
        name: '',
        countryCode: 0,
        phone: 0,
        fullNumber: 0,
        image: '',
        locations: [],
        token: ''
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json['id'],
    name: json['name'],
    countryCode: json['country_code'],
    phone: json['phone'],
    fullNumber: json['full_phone'],
    image: json['image'],
    locations: json['locations'],
    token: json['token'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'country_code': countryCode,
    'phone': phone,
    'full_phone': fullNumber,
    'image': image,
    'locations': locations,
    'token': token
  };
}