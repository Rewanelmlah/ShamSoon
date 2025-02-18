import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/features/splash/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  const MyApp({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          home: const SplashScreen(), // Start with
        );
      },
    );
  }
}