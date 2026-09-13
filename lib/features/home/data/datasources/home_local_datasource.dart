import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/property_listing.dart';
import '../models/property_listing_model.dart';
import '../models/share_service_model.dart';

abstract class HomeLocalDataSource {
  Future<List<PropertyListingModel>> getFeaturedProjects();
  Future<List<PropertyListingModel>> getRecommendedProperties();
  Future<List<ShareServiceModel>> getShareServices();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  /// Test hooks — flip these to exercise Empty/Error states without
  /// touching any other layer. Used primarily from unit tests.
  HomeLocalDataSourceImpl({
    this.simulateError = false,
    this.simulateEmpty = false,
  });

  final bool simulateError;
  final bool simulateEmpty;

  static const _networkDelay = Duration(milliseconds: 700);

  @override
  Future<List<PropertyListingModel>> getFeaturedProjects() async {
    await Future.delayed(_networkDelay);
    if (simulateError) {
      throw const DataFetchException('Failed to load featured projects.');
    }
    if (simulateEmpty) return const [];
    return _featuredProjects;
  }

  @override
  Future<List<PropertyListingModel>> getRecommendedProperties() async {
    await Future.delayed(_networkDelay);
    if (simulateError) {
      throw const DataFetchException('Failed to load recommended properties.');
    }
    if (simulateEmpty) return const [];
    return _recommendedProperties;
  }

  @override
  Future<List<ShareServiceModel>> getShareServices() async {
    await Future.delayed(_networkDelay);
    if (simulateError) {
      throw const DataFetchException('Failed to load Shary Ma3ak services.');
    }
    if (simulateEmpty) return const [];
    return _shareServices;
  }

  static const _featuredProjects = <PropertyListingModel>[
    PropertyListingModel(
      id: 'fp_001',
      title: 'أوجامي بلوم ايلاند الساحل الشمالي',
      location: 'الساحل الشمالي',
      imageAssetPath: 'assets/images/featured_north_coast.jpg', // TODO: add real asset
      listingType: ListingType.featured,
      isVerified: true,
      whatsappNumber: '+201000000001',
      phoneNumber: '+201000000001',
    ),
    PropertyListingModel(
      id: 'fp_002',
      title: 'كمبوند مراسي الساحل الشمالي',
      location: 'الساحل الشمالي',
      imageAssetPath: 'assets/images/featured_marassi.jpg', // TODO: add real asset
      listingType: ListingType.featured,
      isVerified: true,
      whatsappNumber: '+201000000002',
      phoneNumber: '+201000000002',
    ),
  ];

  static const _recommendedProperties = <PropertyListingModel>[
    PropertyListingModel(
      id: 'rp_001',
      title: 'مكاتب - كمبوند سراي القاهرة الجديدة',
      location: 'القاهرة الجديدة',
      imageAssetPath: 'assets/images/recommended_sarai.jpg', // TODO: add real asset
      listingType: ListingType.recommended,
      isVerified: true,
      whatsappNumber: '+201000000003',
      phoneNumber: '+201000000003',
      price: '19,245,492 ج.م',
      investmentReturnPercent: 22,
      resaleLabel: 'إعادة بيع مرتفعة',
    ),
    PropertyListingModel(
      id: 'rp_002',
      title: 'شقق سكنية - كمبوند بالم هيلز القاهرة الجديدة',
      location: 'القاهرة الجديدة',
      imageAssetPath: 'assets/images/recommended_palm_hills.jpg', // TODO: add real asset
      listingType: ListingType.recommended,
      isVerified: true,
      whatsappNumber: '+201000000004',
      phoneNumber: '+201000000004',
      price: '8,750,000 ج.م',
      investmentReturnPercent: 15,
      resaleLabel: 'إعادة بيع متاحة',
    ),
  ];

  static const _shareServices = <ShareServiceModel>[
    ShareServiceModel(
      id: 'svc_001',
      title: 'احجز مع المطوّر',
      subtitle: 'احجز وحدتك أونلاين مباشرة من المطور مع تأكيد فوري عبر منصة شاري',
      iconAssetPath: 'assets/icons/book_developer.png', // TODO: add real asset
    ),
    ShareServiceModel(
      id: 'svc_002',
      title: 'فرص إعادة بيع حصرية',
      subtitle: 'وحدات مميزة بأقل سعر من السوق',
      iconAssetPath: 'assets/icons/resale.png', // TODO: add real asset
      highlightBadge: '40% UNDER MARKET',
    ),
    ShareServiceModel(
      id: 'svc_003',
      title: 'مؤشر شاري',
      subtitle: 'مؤشر سوق العقارات',
      iconAssetPath: 'assets/icons/market_index.png', // TODO: add real asset
    ),
    ShareServiceModel(
      id: 'svc_004',
      title: 'المساعد القانوني',
      subtitle: 'راجع عقدك قبل أن تستثمر',
      iconAssetPath: 'assets/icons/legal_assistant.png', // TODO: add real asset
    ),
  ];
}