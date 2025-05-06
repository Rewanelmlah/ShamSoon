import 'package:shamsoon/features/home/data/data_source/data_source/home_data_source.dart';
import 'package:shamsoon/features/home/data/data_source/repo/repo.dart';

import '../../../core/helpers/global_variables.dart';

void setUpHomeDependencies() {
  sl.registerLazySingleton<HomeRepo>(
        () => HomeRepoImpl(
      sl<HomeDataSource>(),
    ),
  );

  sl.registerLazySingleton<HomeDataSource>(
        () => HomeDataSourceImpl(),
  );


  // sl.registerLazySingleton<NetworkService>(
  //       () => AiService(),
  // );
}
