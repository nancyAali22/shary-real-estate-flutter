import '../../domain/entities/share_service.dart';

class ShareServiceModel extends ShareService {
  const ShareServiceModel({
    required super.id,
    required super.title,
    required super.subtitle,
    required super.iconAssetPath,
    super.highlightBadge,
  });

  /// Prepared for future API integration — not used with local mock data.
  factory ShareServiceModel.fromJson(Map<String, dynamic> json) {
    return ShareServiceModel(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      iconAssetPath: json['iconAssetPath'] as String,
      highlightBadge: json['highlightBadge'] as String?,
    );
  }
}