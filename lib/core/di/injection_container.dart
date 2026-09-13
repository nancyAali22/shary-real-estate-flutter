import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/home_local_datasource.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_featured_projects.dart';
import '../../features/home/domain/usecases/get_recommended_properties.dart';
import '../../features/home/domain/usecases/get_share_services.dart';

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
}