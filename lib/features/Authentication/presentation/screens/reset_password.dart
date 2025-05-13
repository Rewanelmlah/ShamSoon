import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/screens/login.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/customtextformfield.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/helpers/helpers.dart';
import '../../../../core/helpers/validators.dart';
import '../../../../core/widgets/text_fields/default_text_field.dart';

import '../cubit/auth_state.dart';
class ResetPassword extends StatelessWidget {
  final String email;
  ResetPassword({super.key,
    required this.email
  });

  final passCont = TextEditingController();
  final confirmPassCont = TextEditingController();


  @override
  Widget build(BuildContext context) {
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
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Create A New Password",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  DefaultTextField(
                    borderColor: AppColors.primaryColor,
                    title: 'Enter your password',
                    validator: Validators.validateEmpty,
                    controller: passCont,
                    isPassword: true,
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13.sp, // Responsive font size
                    ),
                  ),

                  SizedBox(height: 15.h),
                  DefaultTextField(
                    borderColor: AppColors.primaryColor,
                    title: 'Confirm your password',
                    validator: (value) => Validators.validatePasswordConfirm(value, passCont.text),
                    controller: confirmPassCont,
                    isPassword: true,
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13.sp, // Responsive font size
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) => Helpers.manageBlocConsumer(
                      state.baseStatus,
                      msg: state.msg,
                      actionWhenSuccess: () {
                        if(state.phase == AuthPhase.resetPassword){
                          Go.offAll(LogIn());
                        }
                      },
                    ),
                    child: LoadingButton(title: 'Reset password',onTap: () => context.read<AuthCubit>().resetPassword(
                        email: email,
                        password: passCont.text,
                        confirmPassword: confirmPassCont.text
                    )),
                  )
                ])),
      ),
    );
  }
}
