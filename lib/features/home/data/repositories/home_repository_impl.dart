import '../../domain/entities/property_listing.dart';
import '../../domain/entities/share_service.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._localDataSource);

  final HomeLocalDataSource _localDataSource;

  @override
  Future<List<PropertyListing>> getFeaturedProjects() =>
      _localDataSource.getFeaturedProjects();

  @override
  Future<List<PropertyListing>> getRecommendedProperties() =>
      _localDataSource.getRecommendedProperties();

  @override
  Future<List<ShareService>> getShareServices() =>
      _localDataSource.getShareServices();
}