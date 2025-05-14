import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shamsoon/core/extensions/context_extension.dart';
import 'package:shamsoon/core/extensions/sized_box_helper.dart';
import 'package:shamsoon/core/widgets/app_text.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/generated/assets.dart';
import '../helpers/app_sizes.dart';
import '../helpers/navigation.dart';
import 'buttons/default_button.dart';
import 'custom_loading.dart' show CustomLoading;

Future<dynamic> deleteBottomSheet({
  required BuildContext context,
  required dynamic Function()? onTap,
}) {
  return showDefaultBottomSheet(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppMargin.mH10,
        children: [
          Lottie.asset(Assets.lottieError),
          const AppText(
            'Delete notification?',
            fontWeight: FontWeight.bold,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingButton(
                margin: EdgeInsets.zero,
                title: 'Delete',
                textColor: Colors.white,
                color: Colors.red,
                width: context.width * .4,
                height: 45.h,
                onTap: () => onTap!(),
              ),
              DefaultButton(
                margin: EdgeInsets.zero,
                title: 'Cancel',
                textColor: Colors.black,
                color: Colors.grey,
                width: context.width * .4,
                height: 35.h,
                onTap: () => Go.back(),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future showDefaultBottomSheet({BuildContext? context, required Widget child}) {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context ?? Go.context,
      builder: (context) => DefaultSheetBody(
            child: child,
          ));
}

class DefaultSheetBody extends StatelessWidget {
  final Widget child;
  const DefaultSheetBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(context).bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              padding: EdgeInsets.only(
                bottom: ScreenUtil().bottomBarHeight == 0
                    ? 20.h
                    : ScreenUtil().bottomBarHeight,
                left: 20.w,
                right: 20.w,
                top: 15.h,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Wrap(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 100.w,
                      height: 5.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  15.szH,
                  child,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
