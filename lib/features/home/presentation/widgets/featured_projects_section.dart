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
        // No hard-coded height budget: a fixed-height estimate for the
        // text block below the image (title lines, font metrics) drifts
        // across devices/text scales and was overflowing in practice.
        // IntrinsicHeight sizes this row to whatever its tallest card
        // actually needs, so overflow here is structurally impossible.
        // The dataset is small and fixed (same reasoning as
        // ShareServicesSection), so losing ListView.builder's lazy
        // building costs nothing real.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var index = 0; index < projects.length; index++)
                  Padding(
                    padding: EdgeInsets.only(left: AppSpacing.md.w),
                    child: SlideInItem(
                      delay: Duration(milliseconds: 60 * index),
                      child: FeaturedProjectCard(listing: projects[index]),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}