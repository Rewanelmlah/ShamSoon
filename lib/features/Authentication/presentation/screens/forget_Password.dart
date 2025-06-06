import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/cubit/auth_state.dart';
import 'package:shamsoon/features/Authentication/presentation/screens/otp_view.dart';
import '../../../../core/helpers/navigation.dart';
import '../../../../core/helpers/validators.dart';
import '../widgets/customtextformfield.dart';


class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final emailCont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
                  Form(
                    key: _formKey,
                    child: CustomTextFormField(
                      validator: Validators.validateEmail,
                      controller: emailCont,
                      hintText: "Enter your Email",
                    ),
                  ),
                  SizedBox(height: 30.h),
                  BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) => Helpers.manageBlocConsumer(
                        state.baseStatus,
                        msg: state.msg,
                        actionWhenSuccess: () async {
                          if(state.phase == AuthPhase.forgetPassword){
                            Go.to(OTPScreen(type: OtpType.checkOtpAfterForgetPass, email: emailCont.text,));
                          }}
                    ),
                    child: LoadingButton(
                        title: 'forget password',
                        onTap: () => _formKey.currentState!.validate()?
                        context.read<AuthCubit>().forgetPassword(emailCont.text) : null
                    ),
                  ),
                ])),
      ),
    );
  }
}
