import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/helpers.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:shamsoon/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:shamsoon/features/settings/presentation/widgets/custome_text_feild.dart';

import '../../../../core/widgets/buttons/loading_button.dart';
import '../cubit/setting_state.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {

  final userData = UserCubit.instance.user;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  void initState() {
    nameController.text = userData.fullName;
    emailController.text = userData.email;
    phoneController.text = userData.phoneNumber;
    super.initState();
  }


  bool canChange = false;
  bool _activateControllersListener(){
    if(nameController.text != userData.fullName ||
        emailController.text != userData.email ||
        phoneController.text != userData.phoneNumber
    ){
      setState(() => canChange = true);
      return true;
    }
    setState(() => canChange = false);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, leading: IconButton(
    onPressed: () {
     Navigator.pop(context);
    },
    icon: Icon(Icons.arrow_back_ios,size: 24.sp,),
      ),
       title:Text("Personal Info",style: TextStyle(fontSize: 24.sp,fontWeight: FontWeight.bold),),),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                onChanged: (p0) => _activateControllersListener(),
                 controller: nameController,
                sufficon: Icons.edit_outlined,
                color: const Color(0xFFBFDDD7),
                icon: Icons.account_circle_outlined, label: "Full Name", initialValue: "Alice Cooper"),
              SizedBox(height: 15.h,),
              CustomTextField(
                  onChanged: (p0) => _activateControllersListener(),
                controller: emailController,
                sufficon: Icons.edit_outlined,
                color: const Color(0xFFBFDDD7),icon: Icons.mail_outline, label: "Email", initialValue: "Alice122@gmail.com"),
              SizedBox(height: 15.h,),
              CustomTextField(
                  onChanged: (p0) => _activateControllersListener(),
                controller: phoneController,
                sufficon: Icons.edit_outlined,
                color: const Color(0xFFBFDDD7),icon: Icons.call_outlined, label: "Phone number", initialValue: "+903432432890"),
             SizedBox(height: 15.h,),

              BlocListener<SettingCubit, SettingState>(
                listener: (context, state) => Helpers.manageBlocConsumer(
                  state.baseStatus,
                    msg: state.msg,
                  actionWhenSuccess: () {
                    context.read<UserCubit>().updateUser(state.user!);
                    setState(() => canChange = false);
                  },
                ),
                child: LoadingButton(title: "Save",
                    color: canChange? AppColors.primaryColor : Colors.grey,
                    onTap: () => canChange?
                context.read<SettingCubit>().updateProfile(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text) : null
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

