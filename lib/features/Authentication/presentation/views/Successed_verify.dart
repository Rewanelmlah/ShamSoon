import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/core_widgets/custome_button.dart';
import 'package:shamsoon/features/Authentication/presentation/views/otp_view.dart';

import 'Reset_password.dart';

class SuccessedVerify extends StatelessWidget {
  const SuccessedVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OTPScreen()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18.sp,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 80.h,
            ),
            Center(
                child: Image.asset(
              'assets/images/Verified-pana_1.png',
              height: 320.h,
              width: 320.w,
            )),
            Text(
              'Successfully Verification',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButton(
              text: 'Reset Password',
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ResetPassword()),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            )
          ],
        ),
      ),
    );
  }
}
