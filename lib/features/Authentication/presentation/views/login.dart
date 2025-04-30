import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_state.dart';
import 'package:shamsoon/features/Authentication/presentation/views/forget_Password.dart';
import 'package:shamsoon/features/Authentication/presentation/views/sigh_up.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/Custome_google_button.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/customtextformfield.dart';
import 'package:shamsoon/features/home/presentation/views/layout_view.dart';

import '../../../../core/core_widgets/custome_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: LogIn(),
    );
  }
}

class LogIn extends StatelessWidget {
  LogIn({super.key});

  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
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
            CustomTextFormField(
              controller: emailCont,
              hintText: "Enter your Email",
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              controller: passCont,
              hintText: "Enter your password",
              obscureText: true,
              suffixIcon: Icons.visibility,
              onSuffixIconPressed: () {
                print("Toggle password visibility");
              },
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {
                        // Handle remember me
                      },
                      activeColor: AppColors.primaryColor,
                      checkColor: Colors.white,
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    Go.to(BlocProvider.value(
                        value: context.read<AuthCubit>(),
                        child: const ForgetPassword()
                    ));
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
              listener: (context, state) => Helpers.manageBlocConsumer(
                  state.baseStatus,
                  msg: state.msg,
                actionWhenSuccess: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LayoutScreen()),
                )
              ),
              child: LoadingButton(title: 'Log In', onTap: () async => await context.read<AuthCubit>().login(email: emailCont.text, pass: passCont.text),)
            ),
            Row(
              children: [
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Text(
                    "or",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Divider(thickness: 1, color: Colors.grey)),
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
                      MaterialPageRoute(builder: (ctx) => BlocProvider.value(
                          value: context.read<AuthCubit>(),
                          child: SignUpScreen())),
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
          ])),
    ));
  }
}
