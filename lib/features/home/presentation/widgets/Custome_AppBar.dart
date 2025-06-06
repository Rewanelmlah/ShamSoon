import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/extensions/padding_extension.dart';
import 'package:shamsoon/core/widgets/app_text.dart';
import 'package:shamsoon/features/notifications/presentation/views/notification_screen.dart';
import 'package:badges/badges.dart' as badges;

import '../../../notifications/presentation/cubit/notification_cubit.dart';
import '../../../notifications/presentation/cubit/notification_state.dart';
import '../views/maintenance_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primaryColor, width: 1.5.w),
        ),
        child: CircleAvatar(
          radius: 24.r,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
      ).paddingAll(5),
      // centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back !',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          Text(
            'Make the sun works for you.',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
      actions: [
        BlocProvider(
          create: (context) => NotificationCubit()..getNotificationsCount(),
          child: BlocBuilder<NotificationCubit, NotificationState>(
            builder: (ctx, state) => IconButton(
             icon: badges.Badge(
               showBadge: state.notificationCount! > 0,
               position: badges.BadgePosition.topEnd(top: -15,end: -8),
               badgeContent: AppText(state.notificationCount.toString(), fontSize: state.notificationCount! > 9 ? 10.sp : 14.sp,),
               child: Icon(Icons.notifications_outlined, size: 20.sp, color: AppColors.primaryColor),
             ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider.value(
                    value: ctx.read<NotificationCubit>(),
                    child: const NotificationScreen()
                )));
              },
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.calendar_month,
            size: 20.sp,
            color: AppColors.primaryColor,
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MaintenanceScreen()));
          },
        ),
      ],
    ).paddingTop(10);
  }
}