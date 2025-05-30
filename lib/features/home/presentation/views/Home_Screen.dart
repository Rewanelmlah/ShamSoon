import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/widgets/custom_loading.dart';
import 'package:shamsoon/core/widgets/status_builder.dart';
import 'package:shamsoon/features/home/data/data_source/repo/repo.dart';
import 'package:shamsoon/features/home/presentation/cubit/predict_cubit.dart';
import 'package:shamsoon/features/home/presentation/home_cubit/home_cubit.dart';
import 'package:shamsoon/features/home/presentation/home_cubit/home_state.dart';
import 'package:shamsoon/features/home/presentation/widgets/Custome_AppBar.dart';
import 'package:shamsoon/features/home/presentation/widgets/custome_baterystatus.dart';
import 'package:shamsoon/features/home/presentation/widgets/custome_smallcontainer.dart';

import '../../../../core/helpers/global_variables.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PredictCubit(sl<HomeRepo>()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(sl<HomeRepo>())..getCarbons(),
          )
        ],
          child: const _HomeBody()
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.all(6.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h,),
              BatteryStatusCard(),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CustomResponsiveContainer(text: 'Number of panels', icon: Icons.solar_power_outlined, number: '12'),
                  CustomResponsiveContainer(text: 'Co2 Saved'.toString(), icon: Icons.wb_incandescent_outlined, number: '9k/h')
                ],),
              SizedBox(height: 15.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CustomResponsiveContainer(text: 'Battaries Number', icon: Icons.battery_charging_full_outlined, number: '4'),
                  CustomResponsiveContainer(text: 'Equivalent Trees'.toString(), icon: Icons.forest_outlined, number: '7')
                ],),
              SizedBox(height: 10.h,),
              Text('Recommended Maintenance companies',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold),),
              SizedBox(height: 10.h,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/firstcom.png',height: 100.h,width: 100.w,),
                    SizedBox(width: 10.w,),
                    Image.asset('assets/images/secondcom.png',height: 100.h,width: 100.w,),
                    SizedBox(width: 10.w,), Image.asset('assets/images/thirdcom.png',height: 100.h,width: 100.w,),
                    SizedBox(width: 10.w,), Image.asset('assets/images/firstcom.png',height: 100.h,width: 100.w,),
                    SizedBox(width: 10.w,),  Image.asset('assets/images/secondcom.png',height: 100.h,width: 100.w,),
                    SizedBox(width: 10.w,), Image.asset('assets/images/thirdcom.png',height: 100.h,width: 100.w,),
                  ],
                ),
              ),

            ],

          ),
        ),);
  }
}