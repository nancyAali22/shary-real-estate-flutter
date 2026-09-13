import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// Descriptive ribbon overlaid on the property image, matching the
/// reference's "عائد استثمار مرتفع" badge. The exact percentage is
/// shown separately, next to the resale chip below the image — keeping
/// this ribbon purely qualitative avoids showing the same number twice
/// in two crowded places.
class InvestmentBadge extends StatelessWidget {
  const InvestmentBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm.w,
        vertical: AppSpacing.xs.h,
      ),
      decoration: BoxDecoration(
        // Slightly transparent instead of solid, so the property image
        // underneath stays a bit visible through the ribbon.
        color: AppColors.brandTeal.withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(AppRadius.pill.r),
      ),
      child: Text('عائد استثمار مرتفع', style: AppTypography.badge(context)),
    );
  }
}