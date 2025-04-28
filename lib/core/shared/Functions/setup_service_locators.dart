

import 'package:shamsoon/core/network/ai_service.dart';
import 'package:shamsoon/features/home/di/di.dart';

import '../../helpers/constant_manager.dart';
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
  sl.registerLazySingleton<NetworkService>(
    () => DioService(),
    instanceName: ConstantManager.dioService,
  );

  sl.registerLazySingleton<NetworkService>(
        () => AiService(),
    instanceName: ConstantManager.aiService,
  );

  sl.registerLazySingleton<UserCubit>(
    () => UserCubit(),
  );

  sl.registerFactory<NotificationService>(
    () => NotificationService(),
  );
}
