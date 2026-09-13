import '../entities/property_listing.dart';
import '../entities/share_service.dart';

abstract class HomeRepository {
  Future<List<PropertyListing>> getFeaturedProjects();
  Future<List<PropertyListing>> getRecommendedProperties();
  Future<List<ShareService>> getShareServices();
}