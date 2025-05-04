import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/helpers/navigation.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:shamsoon/features/Authentication/presentation/screens/login.dart';
import 'package:shamsoon/features/home/presentation/views/layout_view.dart';
import 'package:shamsoon/features/onboarding/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _handleNavigation()async{
   await _checkSkippedOnBoarding();
  }

  Future<void> _checkSkippedOnBoarding()async{
    bool result = await UserCubit.instance.checkSkippedOnBoarding();
    if(result){
      await _navigateBasedToken();
    }else{
      Go.offAll(const OnBoarding());
    }
  }

  Future<void> _navigateBasedToken()async{
    bool result = await UserCubit.instance.checkTokenExistOrNot();
    if(result){
      UserCubit.instance.init();
      Go.offAll(LayoutScreen());
    }else{
      Go.offAll(LogIn());
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      _handleNavigation();
      // Navigator.pushReplacement(
      //   context,
      //   PageRouteBuilder(
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         const OnBoarding(),
      //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //
      //       const begin = Offset(0.0, 1.0);
      //       const end = Offset.zero;
      //       const curve = Curves.fastOutSlowIn;
      //
      //       var tween =
      //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //       var offsetAnimation = animation.drive(tween);
      //
      //       return SlideTransition(
      //         position: offsetAnimation,
      //         child: child,
      //       );
      //     },
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', 
          width: 250.w, 
          height: 300.h, 
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
