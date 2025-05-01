import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/core_widgets/custome_button.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/features/Authentication/presentation/views/login.dart';
import 'package:shamsoon/features/Authentication/presentation/views/otp_view.dart';

import 'reset_password.dart';

class SuccessedVerify extends StatefulWidget {
  final String email;
  final OtpType type;
  const SuccessedVerify({super.key,
    required this.email,
    required this.type
  });

  @override
  State<SuccessedVerify> createState() => _SuccessedVerifyState();
}

class _SuccessedVerifyState extends State<SuccessedVerify> {

  void _startTimer()async{
    await Future.delayed(const Duration(seconds: 3));
    if(widget.type == OtpType.verification){
      Go.offAll(const LoginScreen());
    }else{
      Go.offAll(ResetPassword(email: widget.email));
    }
  }

  @override
  void initState() {
    // _startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: () {},
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
