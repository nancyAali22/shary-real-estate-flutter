import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/shimmer_box.dart';

/// Skeleton shown while the Home feed is loading (HomeInitial /
/// HomeLoading). Shaped like the real feed — Featured Projects row,
/// Recommended Properties cards, Shary Ma3ak banner — so the layout
/// doesn't visibly "jump" once real content replaces it. A single
/// Shimmer.fromColors wraps the whole tree so the highlight sweeps
/// across every box together.
class HomeLoadingSkeleton extends StatelessWidget {
  const HomeLoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.border,
      highlightColor: AppColors.cardBackground,
      period: const Duration(milliseconds: 1400),
      child: ListView(
        padding: EdgeInsets.only(bottom: AppSpacing.xl.h),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SizedBox(height: AppSpacing.sm.h),
          _sectionTitleSkeleton(),
          SizedBox(height: AppSpacing.md.h),
          _featuredRowSkeleton(),
          SizedBox(height: AppSpacing.xl.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitleSkeleton(padded: false),
                SizedBox(height: AppSpacing.md.h),
                ShimmerBox(
                  width: double.infinity,
                  height: 260.h,
                  borderRadius: AppRadius.lg,
                ),
                SizedBox(height: AppSpacing.md.h),
                ShimmerBox(
                  width: double.infinity,
                  height: 260.h,
                  borderRadius: AppRadius.lg,
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.xl.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
            child: ShimmerBox(
              width: double.infinity,
              height: 90.h,
              borderRadius: AppRadius.lg,
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitleSkeleton({bool padded = true}) {
    final title = ShimmerBox(width: 140.w, height: 18.h, borderRadius: AppRadius.sm);
    if (!padded) return Align(alignment: AlignmentDirectional.centerStart, child: title);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Align(alignment: AlignmentDirectional.centerStart, child: title),
    );
  }

  Widget _featuredRowSkeleton() {
    return SizedBox(
      height: 280.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
        itemCount: 2,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(left: AppSpacing.md.w),
          child: ShimmerBox(width: 260.w, height: 280.h, borderRadius: AppRadius.lg),
        ),
      ),
    );
  }
}