import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../domain/entities/property_listing.dart';
import 'featured_project_card.dart';

/// "أفضل المشاريع" section: title + a lazily-built horizontal list of
/// [FeaturedProjectCard]s. Uses ListView.builder (not a Row inside a
/// SingleChildScrollView) so off-screen cards are never built — matters
/// once this list grows beyond a handful of mock items.
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
        SizedBox(
          height: 280.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            itemCount: projects.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(left: AppSpacing.md.w),
              child: FeaturedProjectCard(listing: projects[index]),
            ),
          ),
        ),
      ],
    );
  }
}