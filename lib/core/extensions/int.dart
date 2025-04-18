
import 'package:flutter/cupertino.dart';

extension NavigationHelper on int {
  void popUntil(BuildContext context) {
    for (var i = 0; i < this; i++) {
      Navigator.pop(context);
    }
  }
}