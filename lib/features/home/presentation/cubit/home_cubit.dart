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
      // Futures start executing the moment each use case is called, so
      // calling all three before awaiting any of them runs the "requests"
      // concurrently instead of one after another.
      final featuredFuture = _getFeaturedProjects();
      final recommendedFuture = _getRecommendedProperties();
      final servicesFuture = _getShareServices();

      final featured = await featuredFuture;
      final recommended = await recommendedFuture;
      final services = await servicesFuture;

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