import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/extensions/padding_extension.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/helpers/validators.dart';
import 'package:shamsoon/core/widgets/app_text.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/core/widgets/text_fields/default_text_field.dart';
import 'package:shamsoon/features/settings/presentation/cubit/setting_cubit.dart';
import 'package:shamsoon/features/settings/presentation/cubit/setting_state.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/helpers/helpers.dart';
import '../widgets/rating_bar.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText('Feedback', fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
        backgroundColor: AppColors.primaryColor,
      ),
      body: _FeedbackBody()
    );
  }
}

class _FeedbackBody extends StatelessWidget {
  _FeedbackBody({super.key});
  final cont = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: [
        const EmojiRatingBar(),
        Form(
          key: _formKey,
          child: DefaultTextField(
            validator: Validators.validateEmpty,
            controller: cont,
            title: 'Type your feedback here...',
            inputType: TextInputType.multiline,
            borderColor: AppColors.primaryColor,
          ),
        ),
        LoadingButton(title:'Submit',
            onTap: () => _formKey.currentState!.validate()?
        context.read<SettingCubit>().feedback(msg: cont.text) : null
        )
      ],
    ).paddingAll(16);
  }
}



