import 'package:equatable/equatable.dart';

import '../../domain/entities/property_listing.dart';
import '../../domain/entities/share_service.dart';

/// All possible states the Home screen can be in.
/// Kept as a single hierarchy (not one Cubit per section) because the Home
/// screen renders as one cohesive feed — Featured Projects, Recommended
/// Properties and Shary Ma3ak are always loaded and shown together.
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  const HomeLoaded({
    required this.featuredProjects,
    required this.recommendedProperties,
    required this.shareServices,
  });

  final List<PropertyListing> featuredProjects;
  final List<PropertyListing> recommendedProperties;
  final List<ShareService> shareServices;

  @override
  List<Object?> get props =>
      [featuredProjects, recommendedProperties, shareServices];
}

/// All three sections came back empty. Kept distinct from [HomeLoaded] so
/// the UI can show one clear empty-state illustration instead of three
/// separate empty sections stacked on top of each other.
class HomeEmpty extends HomeState {
  const HomeEmpty();
}

class HomeError extends HomeState {
  const HomeError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}