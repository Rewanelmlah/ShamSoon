import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/helpers/cache.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/helpers/validators.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:shamsoon/core/widgets/buttons/default_button.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/core/widgets/default_bottom_sheet.dart';
import 'package:shamsoon/features/Authentication/presentation/screens/login.dart';
import 'package:shamsoon/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:shamsoon/features/settings/presentation/cubit/setting_state.dart';

import '../../../../core/helpers/helpers.dart';
import '../../../../core/widgets/text_fields/default_text_field.dart';


class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});


  void _showLogoutSheet(BuildContext context){
    showDefaultBottomSheet(
      child: BlocProvider.value(
        value: context.read<SettingCubit>(),
        child: Column(
          children: [
            Text("Are you sure you want to logout?", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            LoadingButton(
                onTap: () => context.read<SettingCubit>().logout(),
                title: 'Logout'
            ),
            DefaultButton(onTap: () => Navigator.pop(context), title: "Cancel"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65.h,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.r)),
        ),
        icon: BlocListener<SettingCubit, SettingState>(
          listener: (context, state) => Helpers.manageBlocConsumer(
              state.baseStatus,
              msg: state.msg,
            actionWhenSuccess: ()async {
                if(state.type == SheetType.logout){
                  await context.read<UserCubit>().logout();
                  Navigator.pop(context);
                  Go.offAll(LogIn());
                }
            },
          ),
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SizedBox.square(
                  dimension: 45.r,
                  child: Icon(Icons.exit_to_app, size: 24.sp, color: Colors.red))),
        ),
        label: Text("Log out", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: () => _showLogoutSheet(context),
      ),
    );
  }
}

class DeleteAccButton extends StatelessWidget {
  DeleteAccButton({super.key});

  void _showDeleteAccSheet(BuildContext context){
    showDefaultBottomSheet(
        child: BlocProvider.value(
          value: context.read<SettingCubit>(),
          child: Column(
            children: [
              Text("Are you sure you want to delete your account?", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              DefaultButton(onTap: () => _showConfirmPasswordSheet(context), title: "Delete"),
              DefaultButton(onTap: () => Navigator.pop(context), title: "Cancel"),
            ],
          ),
        ),
    );
  }

  final passCont = TextEditingController();
  final confirmPassCont = TextEditingController();

  void _showConfirmPasswordSheet(BuildContext context){
    showDefaultBottomSheet(
      child: BlocProvider.value(
        value: context.read<SettingCubit>(),
        child: Column(
          spacing: 10.h,
          children: [
            Text("Type your password please", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            DefaultTextField(
              isPassword: true,
              controller: passCont,
              validator: Validators.validatePassword,
              title: 'Password',
            ),
            DefaultTextField(
              isPassword: true,
              controller: confirmPassCont,
              validator: (value) => Validators.validatePasswordConfirm(value, passCont.text),
              title: 'Conform Password',
            ),
            LoadingButton(
                onTap: () => context.read<SettingCubit>().deleteAccount(
                    password: passCont.text,
                    passwordConfirm: confirmPassCont.text
                ),
                title: 'Delete'
            ),
            DefaultButton(onTap: () => Navigator.pop(context), title: "Cancel"),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 65.h,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17.r)),
        ),
        icon: BlocListener<SettingCubit, SettingState>(
          listener: (context, state) => Helpers.manageBlocConsumer(
              state.baseStatus,
              msg: state.msg,
            actionWhenSuccess: () async{
                if(state.type == SheetType.deleteAccount){
                  await context.read<UserCubit>().logout();
                  if(context.mounted){
                    Navigator.pop(context);
                  }
                  Go.offAll(LogIn());
                }
            },
          ),
          child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: SizedBox.square(
                  dimension: 45.r,
                  child: Icon(Icons.exit_to_app, size: 24.sp, color: Colors.red))),
        ),
        label: Text("Delete Account", style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold, color: Colors.white)),
        onPressed: () => _showDeleteAccSheet(context),
      ),
    );
  }
}


