

import 'package:shamsoon/features/home/di/di.dart';

import '../../helpers/global_variables.dart';
import '../../network/dio_service.dart';
import '../../network/network_service.dart';
import '../../notification/notification_service.dart';
import '../cubits/user_cubit/user_cubit.dart';

void setUpServiceLocator() {
  setUpGeneralDependencies();
  setUpHomeDependencies();
}

void setUpGeneralDependencies() {
  // sl.registerLazySingleton<NetworkService>(
  //   () => DioService(),
  // );

  sl.registerLazySingleton<UserCubit>(
    () => UserCubit(),
  );

  sl.registerFactory<NotificationService>(
    () => NotificationService(),
  );
}
