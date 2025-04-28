class RegisterModel {
  final String name;
  final String userName;
  final String email;
  final String pass;
  final String passConfirmation;
  final String phone;

  RegisterModel({
    required this.name,
    required this.email,
    required this.pass,
    required this.phone,
    required this.userName,
    required this.passConfirmation
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': pass,
    'phone': phone,
    'username': userName,
    'password_confirmation': passConfirmation
  };
}
