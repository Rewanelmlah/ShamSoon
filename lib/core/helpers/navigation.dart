import 'package:flutter/material.dart';

class Go {
//<editor-fold desc="default">
  static final GlobalKey<NavigatorState> _navigatorKey =
  GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  static BuildContext get context => _navigatorKey.currentContext!;

  static Future<T?> to<T extends Object?>(Widget page) {
    return _navigatorKey.currentState!.push<T>(MaterialPageRoute(builder: (context) => page));
  }

  // push named with transition
  static Future<T?> off<T extends Object?, TO extends Object?>(Widget page) {
    return _navigatorKey.currentState!.pushReplacement<T, TO>(MaterialPageRoute(builder: (context) => page));
  }


//<editor-fold desc="OFF ALL">
  // pushNamedAndRemoveUntil named with transition
  static Future<T?> offAll<T extends Object?, TO extends Object?>(Widget page) {
    return _navigatorKey.currentState!.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (context) => page),
          (route) => false,
    );
  }

  // back
  static void back<T extends Object?>([T? result]) {
    if (canPop) {
      _navigatorKey.currentState!.pop(result);
    } else {
      _navigatorKey.currentState!.pop(result);
    }
  }

  static void backToInitial<T extends Object?>([T? result]) {
    if (canPop) {
      _navigatorKey.currentState!.popUntil((e) => e.isFirst);
    }
  }

  // can pop
  static bool get canPop => _navigatorKey.currentState!.canPop();
  // may pop
  static Future<bool> get mayPop => _navigatorKey.currentState!.maybePop();
//</editor-fold>
}
