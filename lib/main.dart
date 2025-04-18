import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/shared/Functions/setup_service_locators.dart';
import 'core/helpers/constant_manager.dart';
import 'core/helpers/loading_manager.dart';
import 'core/helpers/navigation.dart';
import 'core/shared/route_observer.dart';
import 'core/widgets/offline_widget.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setUpServiceLocator();
  runApp(const ShamSoon());
}

class ShamSoon extends StatelessWidget {
  

  const ShamSoon({super.key, });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ConstantManager.projectName,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: Go.navigatorKey,
          home: const Scaffold(),
          navigatorObservers: [AppNavigationObserver()],
          builder: (context, child) {
            return OfflineWidget(
              child: FullScreenLoadingManager(child: child!),
            );
          },
        );
      },
    );
  }
}