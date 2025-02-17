import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/home/presentation/widgets/Custome_AppBar.dart';
import 'package:shamsoon/features/home/presentation/widgets/custome_baterystatus.dart';
import 'package:shamsoon/features/home/presentation/widgets/custome_smallcontainer.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13.w),
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding:  EdgeInsets.all(6.w),
          child: SingleChildScrollView(
             scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
              SizedBox(height: 10.h,),
              BatteryStatusCard(),
              SizedBox(height: 15.h,),
             const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                CustomResponsiveContainer(text: 'Number of panels', icon: Icons.solar_power_outlined, number: '12'),
              CustomResponsiveContainer(text: 'Co2 saved', icon: Icons.wb_incandescent_outlined, number: '9k/h')
              ],),
              SizedBox(height: 15.h,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                CustomResponsiveContainer(text: 'battaries Number', icon: Icons.battery_charging_full_outlined, number: '4'),
              CustomResponsiveContainer(text: 'Equivalent trees', icon: Icons.forest_outlined, number: '7')
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
              
              )))));
  }
  }