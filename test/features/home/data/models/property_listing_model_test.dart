import 'package:flutter_test/flutter_test.dart';
import 'package:shary_real_estate/features/home/data/models/property_listing_model.dart';
import 'package:shary_real_estate/features/home/domain/entities/property_listing.dart';

void main() {
  group('PropertyListingModel', () {
    test('is a PropertyListing (data layer stays substitutable for domain)', () {
      const model = PropertyListingModel(
        id: 'p1',
        title: 'Test Project',
        location: 'Cairo',
        imageAssetPath: 'assets/images/test.jpg',
        listingType: ListingType.featured,
      );

      expect(model, isA<PropertyListing>());
    });

    test('fromJson parses all required and optional fields', () {
      final json = {
        'id': 'rp_099',
        'title': 'شقق سكنية',
        'location': 'القاهرة الجديدة',
        'imageAssetPath': 'assets/images/recommended_palm_hills.jpg',
        'listingType': 'recommended',
        'isVerified': true,
        'whatsappNumber': '+201000000009',
        'phoneNumber': '+201000000009',
        'price': '8,750,000 ج.م',
        'investmentReturnPercent': 15,
        'resaleLabel': 'إعادة بيع متاحة',
      };

      final model = PropertyListingModel.fromJson(json);

      expect(model.id, 'rp_099');
      expect(model.listingType, ListingType.recommended);
      expect(model.isVerified, isTrue);
      expect(model.investmentReturnPercent, 15);
      expect(model.resaleLabel, 'إعادة بيع متاحة');
    });

    test(
      'fromJson defaults isVerified to false and leaves optional fields '
          'null when absent',
          () {
        final json = {
          'id': 'fp_010',
          'title': 'مشروع تجريبي',
          'location': 'الساحل الشمالي',
          'imageAssetPath': 'assets/images/featured_marassi.jpg',
          'listingType': 'featured',
        };

        final model = PropertyListingModel.fromJson(json);

        expect(model.isVerified, isFalse);
        expect(model.price, isNull);
        expect(model.investmentReturnPercent, isNull);
        expect(model.resaleLabel, isNull);
      },
    );
  });
}