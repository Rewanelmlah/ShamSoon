import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class ConstantManager {
  static final serviceLocator = GetIt.instance;
  static const String bundleId = "";
  static const String appName = "ShamSoon";
  static const String fontFamily = "Tajawal";
  static const String token = "token";
  static const String projectName = "";
  static const int splashTimer = 4;
  static const String baseUrl = "https://ebcb-154-237-115-197.ngrok-free.app/";
  static const String aiUrl = "https://c6d7-34-145-249-28.ngrok-free.app/";
  static const String dioService = "dioService";
  static const String aiService = "aiService";

  static const String emptyText = "";
  static const int zero = 0;
  static const double zeroAsDouble = 0.0;
  static const int pinCodeFieldsCount = 4;
  static const int maxLines = 4;
  static const double snackbarElevation = 4;
  static const int snackbarDuration = 4;
  static const int connectTimeoutDuration = 30;
  static const int recieveTimeoutDuration = 30;
  static const double customImageSliderAspectRatio = 3;
  // static EdgeInsetsGeometry screenPadding = EdgeInsets.symmetric(horizontal: 12.w, vertical: 36.w);
  static EdgeInsetsGeometry screenWidthPadding = EdgeInsets.symmetric(horizontal: 12.w);
  static EdgeInsetsGeometry screenHeightPadding = EdgeInsets.symmetric(vertical: 36.w);
}

class CacheConstants{
  static const String onBoardingSubmission = 'onBoardingSubmission';
  static const String lastLocation = 'last location';
  static const String conditionsAndTerms = 'conditionsAndTerms';
  static const String isNotificationEnabled = 'isNotificationEnabled';
  // static const String isLoggedIn = 'isLoggedIn';
  // static const String completeProfile = 'completeProfile';
  static const String commonQuestions = 'commonQuestions';
  static const String appMode = 'appMode';
}