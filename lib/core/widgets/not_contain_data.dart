import 'package:flutter/material.dart';
import 'package:flutter_base/src/config/language/locale_keys.g.dart';
import 'package:flutter_base/src/config/res/assets.gen.dart';

import '../../config/res/app_sizes.dart';

class NotContainData extends StatelessWidget {
  const NotContainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppAssets.lottie.noData.lottie(
          width: MediaQuery.of(context).size.width * .7,
          height: MediaQuery.of(context).size.height * .3,
        ),
        SizedBox(height: AppSize.sH10),
        Text(LocaleKeys.errorExeptionNoconnection),
        SizedBox(height: AppSize.sH10),
        Text(LocaleKeys.errorexceptionNotcontaindesc),
      ],
    );
  }
}
