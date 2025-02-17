import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendCodeWidget extends StatefulWidget {
  @override
  _ResendCodeWidgetState createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  int _remainingTime = 60; 
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); 
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void _resendCode() {
    setState(() {
      _remainingTime = 30; 
    });
    _startTimer();
    
    print("Resend code triggered!");
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        
        TextButton(
          onPressed: _resendCode,
          child: Text(
            "Resend Code",
            style: TextStyle(color: Colors.black, fontSize: 16.sp),
          ),
        ),
        Text(
          '$_remainingTime',
          style: TextStyle(color: Colors.black, fontSize: 16.sp),
        )
      ],
    );
  }
}
