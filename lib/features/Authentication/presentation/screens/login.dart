import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/helpers/validators.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/core/widgets/text_fields/default_text_field.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_state.dart';
import 'package:shamsoon/features/Authentication/presentation/screens/forget_Password.dart';
import 'package:shamsoon/features/Authentication/presentation/screens/sigh_up.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/Custome_google_button.dart';
import 'package:shamsoon/features/home/presentation/views/layout_view.dart';

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
  void _changeRememberMe(){
    rememberMe.value = !rememberMe.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 40.h),
              Center(
                  child: Image.asset(
                'assets/images/LOGO-png1_2.png',
                height: 100.h,
                width: 100.w,
              )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30.h),
                  DefaultTextField(
                    borderColor: AppColors.primaryColor,
                    validator: Validators.validateEmail,
                    controller: emailCont,
                    title: "Enter your Email",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 13.sp, // Responsive font size
                    ),
                  ),
                  SizedBox(height: 10.h),
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
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: rememberMe,
                        builder: (context, value, child) => Checkbox(
                          value: value,
                          onChanged: (value) => _changeRememberMe(),
                          activeColor: AppColors.primaryColor,
                          checkColor: Colors.white,
                        ),
                      ),
                      Text(
                        "Remember me",
                        style: TextStyle(color: Colors.black, fontSize: 14.sp),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Go.to(ForgetPassword());
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) =>
                      Helpers.manageBlocConsumer(state.baseStatus,
                          msg: state.msg,
                          actionWhenSuccess: () async {
                        if(state.phase == AuthPhase.login){
                          log('json test${state.user!.toJson().toString()}');
                          await context.read<UserCubit>().setUserLoggedIn(
                              user: state.user!,
                              token: state.user!.token!,
                              isRemember: rememberMe.value
                          );
                          await context.read<AuthCubit>().storeFcmToken();
                          Go.offAll(LayoutScreen());
                        }},
                      ),
                  child: LoadingButton(
                    title: 'Log In',
                    onTap: () async => _formKey.currentState!.validate()
                        ? await context
                            .read<AuthCubit>()
                            .login(email: emailCont.text, pass: passCont.text)
                        : null,
                  )),
              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                    child: Text(
                      "or",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomeGoogleButton(
                onPressed: () {},
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t have an account? ",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => SignUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              )
            ]),
          )),
    ));
  }
}
