import 'dart:developer';

class UserModel {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String? token;
  final int id;
  final bool isNotified;

  UserModel({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.email,
    required this.token,
    this.isNotified = false
  });


  UserModel copyWith({
    String? fullName,
    String? phoneNumber,
    String? email,
    String? token,
    int? id,
    bool? isNotified
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      token: token ?? this.token,
      id: id?? this.id,
      isNotified: isNotified ?? this.isNotified
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    log('the json is ${json.toString()}');
    return UserModel(
      id: json['user']['id'],
      fullName: json['user']["username"],
      phoneNumber: json['user']["phone"],
      email: json['user']["email"],
      token: json["token"],
      isNotified: _getNotifyStatus(json['user']["is_notify"]),
    );
  }

  static bool _getNotifyStatus(int? status) {
    if (status == 1) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    "username": fullName,
    "phone": phoneNumber,
    "email": email,
  };


  Map<String, dynamic> toJsonCaching() => {
    'user': {
      'id': id,
      "username": fullName,
      "phone": phoneNumber,
      "email": email,
      "isNotified": isNotified
    },
    'token': token
  };

}
