import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/shared/Functions/setup_service_locators.dart';
import 'package:shamsoon/features/home/presentation/views/Home_Screen.dart';
import 'core/helpers/cache.dart';
import 'core/helpers/constant_manager.dart';
import 'core/helpers/language.dart';
import 'core/helpers/loading_manager.dart';
import 'core/helpers/navigation.dart';
import 'core/shared/bloc_observer.dart';
import 'core/shared/route_observer.dart';
import 'core/widgets/exeption_view.dart';
import 'core/widgets/offline_widget.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = AppBlocObserver();
  await Future.wait(
    [
      EasyLocalization.ensureInitialized(),
      CacheStorage.init(),
      ScreenUtil.ensureScreenSize()
    ],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  setUpServiceLocator();
  if (kReleaseMode) {
    ErrorWidget.builder =
        (FlutterErrorDetails details) => const ExceptionView();
  }
  runApp(
    EasyLocalization(
      supportedLocales: Languages.suppoerLocales,
      path: 'assets/translations',
      startLocale: const Locale('ar'),
      saveLocale: true,
      fallbackLocale: const Locale('ar'),
      child: const ShamSoon(),
    ),
  );
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
          home: HomeScreen(),
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