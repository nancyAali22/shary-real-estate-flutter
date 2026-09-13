import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../domain/entities/property_listing.dart';
import 'recommended_property_card.dart';

/// "الوحدات الموصى بها" section: title + full-width vertical cards.
/// Rendered as a plain Column (not its own ListView.builder) because it
/// sits inside the page's single outer ListView — nesting a second
/// scrollable here would create ambiguous/unbounded scroll physics.
/// The mock dataset is small and finite, so eager building is fine; if
/// this grows into a long, independently-paginated feed later, it should
/// move to its own screen with its own ListView.builder instead.
class RecommendedPropertiesSection extends StatelessWidget {
  const RecommendedPropertiesSection({required this.properties, super.key});

  final List<PropertyListing> properties;

  @override
  Widget build(BuildContext context) {
    if (properties.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الوحدات الموصى بها', style: AppTypography.heading2(context)),
          SizedBox(height: AppSpacing.md.h),
          for (final property in properties) ...[
            RecommendedPropertyCard(listing: property),
            SizedBox(height: AppSpacing.md.h),
          ],
        ],
      ),
    );
  }
}