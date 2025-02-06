import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/onboarding/onboarding_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // الانتقال للشاشة الرئيسية بعد 2 ثانية مع أنيميشن
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const OnBoarding(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // هنا يتم تحديد الأنيميشن
            const begin = Offset(0.0, 1.0); // ابدأ من أسفل الشاشة
            const end = Offset.zero;
            const curve = Curves.fastOutSlowIn;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // لون خلفية الشاشة
      body: Center(
        child: Image.asset(
          'assets/images/logo.png', // مسار الصورة
          width: 250.w, // ضبط العرض باستخدام ScreenUtil
          height: 300.h, // ضبط الطول باستخدام ScreenUtil
          fit: BoxFit.contain, // لعرض الصورة كاملة
        ),
      ),
    );
  }
}
