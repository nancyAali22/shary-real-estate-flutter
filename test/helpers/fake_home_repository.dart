import 'package:shary_real_estate/core/errors/exceptions.dart';
import 'package:shary_real_estate/features/home/domain/entities/property_listing.dart';
import 'package:shary_real_estate/features/home/domain/entities/share_service.dart';
import 'package:shary_real_estate/features/home/domain/repositories/home_repository.dart';

/// Test double for [HomeRepository]. Each test configures exactly what
/// each method returns (or whether every call throws) without touching
/// the real local datasource.
class FakeHomeRepository implements HomeRepository {
  FakeHomeRepository({
    this.featuredProjects = const [],
    this.recommendedProperties = const [],
    this.shareServices = const [],
    this.throwsError = false,
  });

  final List<PropertyListing> featuredProjects;
  final List<PropertyListing> recommendedProperties;
  final List<ShareService> shareServices;
  final bool throwsError;

  @override
  Future<List<PropertyListing>> getFeaturedProjects() async {
    if (throwsError) {
      throw const DataFetchException('Failed to load featured projects.');
    }
    return featuredProjects;
  }

  @override
  Future<List<PropertyListing>> getRecommendedProperties() async {
    if (throwsError) {
      throw const DataFetchException('Failed to load recommended properties.');
    }
    return recommendedProperties;
  }

  @override
  Future<List<ShareService>> getShareServices() async {
    if (throwsError) {
      throw const DataFetchException('Failed to load Shary Ma3ak services.');
    }
    return shareServices;
  }
}