import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app_colors.dart';
import '../helpers/app_sizes.dart';
import '../helpers/loading_manager.dart';


class CustomLoading {
  static showLoadingView() {
    return Center(
      child: SpinKitDoubleBounce(
        color: AppColors.primaryColor,
        size: AppSize.sH40,
      ),
    );
  }

  static showFullScreenLoading() {
    FullScreenLoadingManager.show();
  }

  static hideFullScreenLoading() {
    return FullScreenLoadingManager.hide();
  }
}
