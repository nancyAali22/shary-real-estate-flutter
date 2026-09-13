import '../entities/property_listing.dart';
import '../repositories/home_repository.dart';

class GetRecommendedProperties {
  const GetRecommendedProperties(this._repository);

  final HomeRepository _repository;

  Future<List<PropertyListing>> call() => _repository.getRecommendedProperties();
}