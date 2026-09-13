import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/usecases/get_featured_projects.dart';
import '../../domain/usecases/get_recommended_properties.dart';
import '../../domain/usecases/get_share_services.dart';
import 'home_state.dart';

/// Owns the Home screen's data-loading lifecycle. Widgets never call the
/// use cases directly — they dispatch through this Cubit and rebuild off
/// [HomeState], keeping all business logic out of the UI layer.
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetFeaturedProjects getFeaturedProjects,
    required GetRecommendedProperties getRecommendedProperties,
    required GetShareServices getShareServices,
  })  : _getFeaturedProjects = getFeaturedProjects,
        _getRecommendedProperties = getRecommendedProperties,
        _getShareServices = getShareServices,
        super(const HomeInitial());

  final GetFeaturedProjects _getFeaturedProjects;
  final GetRecommendedProperties _getRecommendedProperties;
  final GetShareServices _getShareServices;

  Future<void> loadHome() async {
    emit(const HomeLoading());
    try {
      // The record `.wait` extension (dart:async, Dart 3.0+) starts all
      // three requests concurrently AND attaches a listener to every
      // one of them immediately. That matters: awaiting them one at a
      // time instead (three separate `await` statements) means that if
      // the first one throws, the other two — which may already have
      // rejected too — are left with no listener at all, and Dart
      // reports that as an unhandled exception on the zone instead of
      // routing it through this catch block. `.wait` avoids that while
      // still preserving each future's own type at its own position.
      final (featured, recommended, services) = await (
      _getFeaturedProjects(),
      _getRecommendedProperties(),
      _getShareServices(),
      ).wait;

      final allEmpty =
          featured.isEmpty && recommended.isEmpty && services.isEmpty;

      emit(
        allEmpty
            ? const HomeEmpty()
            : HomeLoaded(
          featuredProjects: featured,
          recommendedProperties: recommended,
          shareServices: services,
        ),
      );
    } on DataFetchException catch (e) {
      emit(HomeError(e.message));
    } catch (_) {
      emit(const HomeError('حدث خطأ غير متوقع، حاول مرة أخرى.'));
    }
  }
}