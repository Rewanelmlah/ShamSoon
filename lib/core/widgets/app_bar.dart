import 'package:flutter/material.dart';
import 'package:flutter_base/src/core/extensions/context_extension.dart';
import 'package:flutter_base/src/core/extensions/padding_extension.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/res/color_manager.dart';

enum AppPhase{auth, other}
enum OtherPhase {main, other}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final AppPhase? appPhase;
  final OtherPhase? otherPhase;
  final Widget? flexibleSpace;
  final Widget? title;
  final List<Widget>? actions;
  final double? appBarHeight;

  const CustomAppBar({super.key,
    this.appPhase = AppPhase.other,
    this.otherPhase = OtherPhase.other,
    this.flexibleSpace,
    this.title,
    this.actions,
    this.appBarHeight
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      titleTextStyle: const TextStyle(color: Colors.white),
      flexibleSpace: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
            width: context.width * 0.7,
            child: flexibleSpace
        ).paddingAll(10),
      ),
      backgroundColor: appPhase == AppPhase.auth?
      null : AppColors.primaryColor,
      leading: otherPhase == OtherPhase.other? Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: Colors.grey.withOpacity(
              appPhase == AppPhase.auth?  0.05 : 0.2
          ),
        ),
        child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
                Icons.arrow_back,
                color: appPhase == AppPhase.auth?
                Colors.black : Colors.white
            )
        ),
      ).paddingAll(8) : null,
      title: title,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, appBarHeight?? 56.h);
}