import 'package:shary_real_estate/core/errors/exceptions.dart';
import 'package:shary_real_estate/features/home/data/datasources/home_local_datasource.dart';
import 'package:shary_real_estate/features/home/data/models/property_listing_model.dart';
import 'package:shary_real_estate/features/home/data/models/share_service_model.dart';

/// Test double for [HomeLocalDataSource]. Unlike the real
/// [HomeLocalDataSourceImpl], this never waits 700ms — tests should be
/// fast and deterministic, not simulate a fake network delay.
class FakeHomeLocalDataSource implements HomeLocalDataSource {
  FakeHomeLocalDataSource({
    this.featuredProjects = const [],
    this.recommendedProperties = const [],
    this.shareServices = const [],
    this.throwsError = false,
  });

  final List<PropertyListingModel> featuredProjects;
  final List<PropertyListingModel> recommendedProperties;
  final List<ShareServiceModel> shareServices;
  final bool throwsError;

  @override
  Future<List<PropertyListingModel>> getFeaturedProjects() async {
    if (throwsError) {
      throw const DataFetchException('Failed to load featured projects.');
    }
    return featuredProjects;
  }

  @override
  Future<List<PropertyListingModel>> getRecommendedProperties() async {
    if (throwsError) {
      throw const DataFetchException('Failed to load recommended properties.');
    }
    return recommendedProperties;
  }

  @override
  Future<List<ShareServiceModel>> getShareServices() async {
    if (throwsError) {
      throw const DataFetchException('Failed to load Shary Ma3ak services.');
    }
    return shareServices;
  }
}