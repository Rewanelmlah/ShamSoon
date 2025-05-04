import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/helpers/validators.dart';
import 'package:shamsoon/core/network/network_service.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/features/Authentication/data/models/register.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_state.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/Custome_google_button.dart';
import 'package:shamsoon/features/Authentication/presentation/widgets/customtextformfield.dart';

import '../../../../core/helpers/constant_manager.dart';
import '../../../../core/helpers/global_variables.dart';
import 'otp_view.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final userNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _setToken(String token){
    sl<NetworkService>(instanceName: ConstantManager.dioService).setToken(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: Image.asset(
                    'assets/images/LOGO-png1_2.png',
                    height: 100.h,
                    width: 100.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  validator: Validators.validateEmpty,
                  hintText: "Enter your Name",
                  controller: nameController,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  validator: Validators.validateEmpty,
                  hintText: "Enter your user name",
                  controller: userNameController,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  validator: Validators.validateEmpty,
                  hintText: "Enter your phone",
                  controller: phoneController,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  validator: Validators.validateEmail,
                  hintText: "Enter your Email",
                  controller: emailController,
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  validator: Validators.validatePassword,
                  hintText: "Enter your password",
                  obscureText: true,
                  suffixIcon: Icons.visibility,
                  controller: passwordController,
                  onSuffixIconPressed: () {},
                ),
                SizedBox(height: 15.h),
                CustomTextFormField(
                  validator: (value) => Validators.validatePasswordConfirm(value, passwordController.text),
                  hintText: "Confirm your password",
                  obscureText: true,
                  controller: confirmPasswordController,
                  suffixIcon: Icons.visibility,
                  onSuffixIconPressed: () {},
                ),
                SizedBox(height: 20.h),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) => Helpers.manageBlocConsumer(
                    state.baseStatus,
                    msg: state.msg,
                    // actionWhenSuccess: () => Navigator.push(context, MaterialPageRoute(builder: (ctx) => BlocProvider.value(
                    //     value: context.read<AuthCubit>(),
                    //     child: const LoginScreen()),)),
                    actionWhenSuccess: () {
                      if(state.phase == AuthPhase.register){
                        _setToken(state.user!.token!);
                        Go.to( const OTPScreen(type: OtpType.verification));
                      }
                    },
                  ),
                  child: LoadingButton(
                    title: 'Sign Up',
                    onTap: () => _formKey.currentState!.validate()?
                    // context.read<AuthCubit>().register(
                    //   context,
                    //     RegisterModel(
                    //         name: 'nameController.text',
                    //         pass: 'Ahmed123',
                    //         email: 'emaixssslCsonxtrsasollser.teasxtss@g.c',
                    //         phone: '5555sx55777',
                    //         userName: 'usssexsrsNasmeCsontrloller.tasasext',
                    //         passConfirmation: 'Ahmed123'
                    //     )) : null,
                  
                    context.read<AuthCubit>().register(
                      context,
                        RegisterModel(
                            name: nameController.text,
                            email: emailController.text,
                            pass: passwordController.text,
                            phone: phoneController.text,
                            userName: userNameController.text,
                            passConfirmation: confirmPasswordController.text)) : null,
                  ),
                ),
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
                SizedBox(height: 20.h),
                CustomeGoogleButton(onPressed: () {}),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Do you have an account? ",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Log In",
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
