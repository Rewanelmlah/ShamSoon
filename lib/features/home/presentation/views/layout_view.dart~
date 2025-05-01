import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/features/Analystics/presentation/views/analystics_screen.dart';
import 'package:shamsoon/features/community/presentation/views/Community_screen.dart';
import 'package:shamsoon/features/home/presentation/views/Home_Screen.dart';
import 'package:shamsoon/features/settings/presentation/views/setting_screen.dart';

class LayoutScreen extends StatefulWidget {
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    EnergyDashboard(),
    CommunityScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Color(0xFF7FBCAE),
        selectedLabelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        items:  [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,size: 28.sp,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined,size: 28.sp,),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined,size: 28.sp,),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,size: 28.sp,),
            label: 'Settings',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}



