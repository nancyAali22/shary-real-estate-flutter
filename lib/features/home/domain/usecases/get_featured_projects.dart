import '../entities/property_listing.dart';
import '../repositories/home_repository.dart';

class GetFeaturedProjects {
  const GetFeaturedProjects(this._repository);

  final HomeRepository _repository;

  Future<List<PropertyListing>> call() => _repository.getFeaturedProjects();
}