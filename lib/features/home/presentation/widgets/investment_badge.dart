import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';

/// Small pill badge showing the investment return percentage,
/// overlaid on the top corner of a property image.
class InvestmentBadge extends StatelessWidget {
  const InvestmentBadge({required this.percent, super.key});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm.w,
        vertical: AppSpacing.xs.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.brandTeal,
        borderRadius: BorderRadius.circular(AppRadius.pill.r),
      ),
      child: Text(
        'عائد استثمار مرتفع $percent%',
        style: AppTypography.badge(context),
      ),
    );
  }
}