import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shary_real_estate/features/home/data/models/property_listing_model.dart';
import 'package:shary_real_estate/features/home/domain/entities/property_listing.dart';
import 'package:shary_real_estate/features/home/domain/usecases/get_featured_projects.dart';
import 'package:shary_real_estate/features/home/domain/usecases/get_recommended_properties.dart';
import 'package:shary_real_estate/features/home/domain/usecases/get_share_services.dart';
import 'package:shary_real_estate/features/home/presentation/cubit/home_cubit.dart';
import 'package:shary_real_estate/features/home/presentation/cubit/home_state.dart';

import '../../../../helpers/fake_home_repository.dart';

void main() {
  const project = PropertyListingModel(
    id: 'fp_1',
    title: 'مشروع 1',
    location: 'الساحل الشمالي',
    imageAssetPath: 'assets/images/featured_marassi.jpg',
    listingType: ListingType.featured,
  );

  HomeCubit buildCubit(FakeHomeRepository repository) {
    return HomeCubit(
      getFeaturedProjects: GetFeaturedProjects(repository),
      getRecommendedProperties: GetRecommendedProperties(repository),
      getShareServices: GetShareServices(repository),
    );
  }

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, HomeLoaded] when at least one use case returns data',
    build: () => buildCubit(FakeHomeRepository(featuredProjects: const [project])),
    act: (cubit) => cubit.loadHome(),
    expect: () => [const HomeLoading(), isA<HomeLoaded>()],
  );

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, HomeEmpty] when every use case returns an empty list',
    build: () => buildCubit(FakeHomeRepository()),
    act: (cubit) => cubit.loadHome(),
    expect: () => [const HomeLoading(), const HomeEmpty()],
  );

  blocTest<HomeCubit, HomeState>(
    'emits [HomeLoading, HomeError] when a use case throws DataFetchException',
    build: () => buildCubit(FakeHomeRepository(throwsError: true)),
    act: (cubit) => cubit.loadHome(),
    expect: () => [const HomeLoading(), isA<HomeError>()],
  );
}