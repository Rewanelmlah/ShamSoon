import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_state.dart';
import 'package:shamsoon/features/Authentication/presentation/views/login.dart';
import 'package:shamsoon/features/Authentication/presentation/views/otp_view.dart';

import '../../../../core/core_widgets/custome_button.dart';
import '../widgets/customtextformfield.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    "Forget Password",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Enter your email account to \n      reset your password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextFormField(
                    hintText: "Enter your Email",
                  ),
                  SizedBox(height: 30.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {},
                    child: CustomButton(
                      onPressed: () {
                        context.read<AuthCubit>().forgetPassword('ahmed@gmail.com');
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>
                        //       OTPScreen()),
                        // );
                      },
                      text: 'Reset Password',
                    ),
                  ),
                ])),
      ),
    );
  }
}
