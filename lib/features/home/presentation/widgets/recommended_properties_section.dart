import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/slide_in_item.dart';
import '../../domain/entities/property_listing.dart';
import 'recommended_property_card.dart';

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
          for (var i = 0; i < properties.length; i++) ...[
            SlideInItem(
              delay: Duration(milliseconds: 60 * i),
              child: RecommendedPropertyCard(listing: properties[i]),
            ),
            SizedBox(height: AppSpacing.md.h),
          ],
        ],
      ),
    );
  }
}