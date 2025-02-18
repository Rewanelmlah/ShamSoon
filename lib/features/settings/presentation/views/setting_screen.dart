import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/settings/presentation/views/contact_us.dart';
import 'package:shamsoon/features/settings/presentation/views/personal_info.dart';
import 'package:shamsoon/features/settings/presentation/widgets/custome_tile.dart';
import 'package:shamsoon/features/settings/presentation/widgets/logout_button.dart';

class SettingsScreen extends StatefulWidget {
    

  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Settings", style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold))),
      body: Padding(
        padding: EdgeInsets.all(14.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            CustomTile(
              color: Colors.white,
              icon: Icons.account_circle_outlined,
              title: "Personal info",
               onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalInfoScreen())),
          
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 65.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.r),
                border: Border.all(color: AppColors.primaryColor, width: 2.w),
              ),
              child: ListTile(
                leading: Icon(Icons.palette_outlined, size: 32.sp, color: Colors.teal),
                title: Text("Dark mode", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                trailing: Switch(
                  activeTrackColor: AppColors.primaryColor,
                  activeColor: Colors.white,
                  inactiveTrackColor: AppColors.primaryColor,
                  inactiveThumbColor: Colors.white,
                  value: _isDarkMode,
                  onChanged: null,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CustomTile(
              color: Colors.white,
              icon: Icons.contact_support_outlined,
              title: "Contact Us",
              onTap: ()  => Navigator.push(context, MaterialPageRoute(builder: (_) => ContactUsScreen())),
          
            ),
            SizedBox(height: 20.h),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}