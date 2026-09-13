import 'package:equatable/equatable.dart';

/// Distinguishes horizontal "Featured projects" cards from
/// vertical "Recommended properties" cards, since they render
/// different levels of detail even though they share the same entity.
enum ListingType { featured, recommended }

class PropertyListing extends Equatable {
  const PropertyListing({
    required this.id,
    required this.title,
    required this.location,
    required this.imageAssetPath,
    required this.listingType,
    this.isVerified = false,
    this.whatsappNumber,
    this.phoneNumber,
    this.price,
    this.investmentReturnPercent,
    this.resaleLabel,
  });

  final String id;
  final String title;
  final String location;
  final String imageAssetPath;
  final ListingType listingType;
  final bool isVerified;
  final String? whatsappNumber;
  final String? phoneNumber;
  final String? price;
  final int? investmentReturnPercent;
  final String? resaleLabel;

  @override
  List<Object?> get props => [
    id,
    title,
    location,
    imageAssetPath,
    listingType,
    isVerified,
    whatsappNumber,
    phoneNumber,
    price,
    investmentReturnPercent,
    resaleLabel,
  ];
}