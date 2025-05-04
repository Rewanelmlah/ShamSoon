import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/helpers/cache.dart';
import 'package:shamsoon/core/helpers/constant_manager.dart';

import '../../../Authentication/presentation/screens/login.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              CacheStorage.write(CacheConstants.onBoardingSubmission, true);
              // Navigate directly to HomeScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => LogIn(),
                ),
              );
            },
            child: Text(
              "Skip",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
