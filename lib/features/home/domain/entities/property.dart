import 'package:equatable/equatable.dart';

/// A unified real-estate listing entity, covering both "Featured
/// Projects" (minimal info) and "Recommended Properties" (full
/// investment info) — a single card variant is chosen at the UI
/// layer based on which optional fields are present.
class Property extends Equatable {
  const Property({
    required this.id,
    required this.title,
    required this.location,
    required this.imageAsset,
    this.whatsappNumber,
    this.phoneNumber,
    this.price,
    this.investmentReturnPercent,
    this.isResaleOpportunity = false,
    this.isVerified = false,
  });

  final String id;
  final String title;
  final String location;
  final String imageAsset;
  final String? whatsappNumber;
  final String? phoneNumber;
  final double? price;
  final int? investmentReturnPercent;
  final bool isResaleOpportunity;
  final bool isVerified;

  @override
  List<Object?> get props => [
    id,
    title,
    location,
    imageAsset,
    whatsappNumber,
    phoneNumber,
    price,
    investmentReturnPercent,
    isResaleOpportunity,
    isVerified,
  ];
}