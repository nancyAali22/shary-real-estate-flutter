import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/home_local_datasource.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_featured_projects.dart';
import '../../features/home/domain/usecases/get_recommended_properties.dart';
import '../../features/home/domain/usecases/get_share_services.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

/// Registers every dependency the app needs.
/// Called once from `main()` before `runApp`.
void setupDependencyInjection() {
  // Data sources
  sl.registerLazySingleton<HomeLocalDataSource>(
        () => HomeLocalDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImpl(sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetFeaturedProjects(sl()));
  sl.registerLazySingleton(() => GetRecommendedProperties(sl()));
  sl.registerLazySingleton(() => GetShareServices(sl()));

  // Presentation — factory, not singleton: each HomePage mount should get
  // a fresh Cubit starting from HomeInitial, not a shared/stale instance.
  sl.registerFactory(
        () => HomeCubit(
      getFeaturedProjects: sl(),
      getRecommendedProperties: sl(),
      getShareServices: sl(),
    ),
  );
}