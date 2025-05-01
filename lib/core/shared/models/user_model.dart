import 'dart:developer';

class UserModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? token;

  UserModel({
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.token,
  });

  factory UserModel.initial() => UserModel(
        fullName: '',
        phoneNumber: '',
        email: '',
        token: '',
      );

  UserModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? token,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      token: token ?? this.token,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    log('the json is ${json.toString()}');
    return UserModel(
      fullName: json['user']["username"],
      phoneNumber: json['user']["phone"],
      email: json['user']["email"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "email": email,
      };
}
