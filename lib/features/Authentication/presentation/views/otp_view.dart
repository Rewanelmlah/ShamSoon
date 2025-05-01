import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_state.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/resend_code.dart';

import '../../../../core/app_colors.dart';
import 'Successed_verify.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String pinCode = '';

  @override
  void initState() {
    context.read<AuthCubit>().sendEmailVerification();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: TextStyle(
        fontSize: 20.sp,
        color: AppColors.primaryColor,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Enter the code sent to your email",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Pinput(
                    length: 5,
                    onCompleted: (value) => pinCode = value,
                    onChanged: (value) => pinCode = value,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: AppColors.primaryColor)),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) => Helpers.manageBlocConsumer(
                        state.baseStatus,
                      msg: state.msg,
                      actionWhenSuccess: () => Go.to(const SuccessedVerify()),
                    ),
                      builder: (context, state) =>
                          LoadingButton(
                            title: 'Verify',
                            onTap: () => context.read<AuthCubit>().verifyEmail(
                              email: state.user!.email,
                              otp: pinCode,
                          ),
                          )),
                  ResendCodeWidget(),
                  SizedBox(
                    height: 100.h,
                  )
                ])),
      ),
    );
  }
}
