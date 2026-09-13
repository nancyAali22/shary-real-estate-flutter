import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/slide_in_item.dart';
import '../../domain/entities/property_listing.dart';
import 'featured_project_card.dart';

class FeaturedProjectsSection extends StatelessWidget {
  const FeaturedProjectsSection({required this.projects, super.key});

  final List<PropertyListing> projects;

  /// Height budget for everything below the image inside
  /// FeaturedProjectCard: 2-line title (~45) + xs gap (4) +
  /// location line (~17) + md gap (12) + contact buttons row (40),
  /// plus a ~12px safety margin for font-metric variance across devices.
  /// Keep this in sync if FeaturedProjectCard's text content changes.
  static const double _cardTextBlockHeight = 130;

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: Text(
            'أفضل المشاريع',
            style: AppTypography.heading2(context),
          ),
        ),
        SizedBox(height: AppSpacing.md.h),
        SizedBox(
          height:
          (260.w * 9 / 16) +
              AppSpacing.md.w * 2 +
              _cardTextBlockHeight.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            itemCount: projects.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: AppSpacing.md.w),
              child: SlideInItem(
                delay: Duration(milliseconds: 60 * index),
                child: FeaturedProjectCard(listing: projects[index]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}