import 'package:equatable/equatable.dart';

class ShareService extends Equatable {
  const ShareService({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.iconAssetPath,
    this.highlightBadge,
  });

  final String id;
  final String title;
  final String subtitle;
  final String iconAssetPath;
  final String? highlightBadge;

  @override
  List<Object?> get props => [id, title, subtitle, iconAssetPath, highlightBadge];
}