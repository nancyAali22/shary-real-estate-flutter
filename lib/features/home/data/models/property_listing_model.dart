import '../../domain/entities/property_listing.dart';

class PropertyListingModel extends PropertyListing {
  const PropertyListingModel({
    required super.id,
    required super.title,
    required super.location,
    required super.imageAssetPath,
    required super.listingType,
    super.isVerified,
    super.whatsappNumber,
    super.phoneNumber,
    super.price,
    super.investmentReturnPercent,
    super.resaleLabel,
  });

  /// Prepared for future API integration — not used with local mock data.
  factory PropertyListingModel.fromJson(Map<String, dynamic> json) {
    return PropertyListingModel(
      id: json['id'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      imageAssetPath: json['imageAssetPath'] as String,
      listingType: ListingType.values.byName(json['listingType'] as String),
      isVerified: json['isVerified'] as bool? ?? false,
      whatsappNumber: json['whatsappNumber'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      price: json['price'] as String?,
      investmentReturnPercent: json['investmentReturnPercent'] as int?,
      resaleLabel: json['resaleLabel'] as String?,
    );
  }
}