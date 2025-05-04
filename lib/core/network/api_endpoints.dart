class ApiConstants {
  static const String players = '................................';

  // ai
  static const String predict = 'predict';

  // back end

  // Auth
  static const String users = 'api/v1/users';
  static const String login = '$users/login';
  static const String logout = '$users/logout';
  static const String register = '$users/register';
  static const String checkOtp = '$users/check-otp';
  static const String resetPassword = '$users/reset-password';
  static const String sendEmailVerification = '$users/email/verify/send';
  static const String verifyEmail = '$users/email/verify';
  static const String forgetPassword = '$users/forget-password';

  // Posts
  static const String posts = '$users/posts';
  static const String deletePost = '$users/posts';
  static const String comments = '/comments';


}
