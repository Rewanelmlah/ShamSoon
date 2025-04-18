import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../app_colors.dart';
import '../helpers/app_sizes.dart';
import '../helpers/constant_manager.dart';
import '../helpers/navigation.dart';

class MessageUtils {
  static void showSnackBar(
    String message, {
    Color? backgroundColor,
    Color? textColor,
    BuildContext? context,
  }) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: ConstantManager.snackbarDuration),
      content: Text(
        message,
        style:
            TextStyle(color: textColor ?? Colors.red, fontSize: FontSize.s14),
      ),
      backgroundColor: backgroundColor ?? Colors.white,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context ?? Go.navigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  static void showSimpleToast({
    required String msg,
    Color? color,
    Color? textColor,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: color ?? AppColors.primaryColor,
      textColor: textColor ?? Colors.white,
      fontSize: FontSize.s16,
    );
  }
}
