import 'package:flutter_test/flutter_test.dart';
import 'package:shary_real_estate/core/errors/exceptions.dart';
import 'package:shary_real_estate/features/home/data/models/property_listing_model.dart';
import 'package:shary_real_estate/features/home/data/models/share_service_model.dart';
import 'package:shary_real_estate/features/home/data/repositories/home_repository_impl.dart';
import 'package:shary_real_estate/features/home/domain/entities/property_listing.dart';

import '../../../../helpers/fake_home_local_datasource.dart';

void main() {
  const featured = [
    PropertyListingModel(
      id: 'fp_1',
      title: 'مشروع 1',
      location: 'الساحل الشمالي',
      imageAssetPath: 'assets/images/featured_marassi.jpg',
      listingType: ListingType.featured,
    ),
  ];
  const services = [
    ShareServiceModel(
      id: 'svc_1',
      title: 'خدمة',
      subtitle: 'وصف',
      iconAssetPath: 'assets/icons/resale.png',
    ),
  ];

  group('HomeRepositoryImpl', () {
    test('returns whatever the datasource returns, unchanged', () async {
      final repository = HomeRepositoryImpl(
        FakeHomeLocalDataSource(featuredProjects: featured, shareServices: services),
      );

      expect(await repository.getFeaturedProjects(), featured);
      expect(await repository.getShareServices(), services);
    });

    test('propagates DataFetchException from the datasource without wrapping it', () {
      final repository = HomeRepositoryImpl(FakeHomeLocalDataSource(throwsError: true));

      expect(
            () => repository.getFeaturedProjects(),
        throwsA(isA<DataFetchException>()),
      );
    });
  });
}