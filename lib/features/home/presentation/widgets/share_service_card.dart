import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../domain/entities/share_service.dart';

/// A single "Shary Ma3ak" service tile: icon, title, subtitle, and an
/// optional highlight badge (e.g. "40% UNDER MARKET"). Purely
/// presentational, same pattern as the property cards — it renders
/// whatever [service] it's given and holds no state of its own.
class ShareServiceCard extends StatelessWidget {
  const ShareServiceCard({required this.service, super.key});

  final ShareService service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.md.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.lg.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              _ServiceIcon(assetPath: service.iconAssetPath),
              if (service.highlightBadge != null)
                Positioned(
                  top: -AppSpacing.xs.h,
                  right: -AppSpacing.xs.w,
                  child: _HighlightBadge(label: service.highlightBadge!),
                ),
            ],
          ),
          SizedBox(height: AppSpacing.sm.h),
          Text(
            service.title,
            style: AppTypography.sectionTitle(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: AppSpacing.xs.h),
          Text(
            service.subtitle,
            style: AppTypography.caption(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ServiceIcon extends StatelessWidget {
  const _ServiceIcon({required this.assetPath});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44.w,
      height: 44.w,
      child: Image.asset(
        assetPath,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.miscellaneous_services_rounded,
          size: 32.sp,
          color: AppColors.brandTeal,
        ),
      ),
    );
  }
}

class _HighlightBadge extends StatelessWidget {
  const _HighlightBadge({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.xs.w,
        vertical: 2.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.brandYellow,
        borderRadius: BorderRadius.circular(AppRadius.sm.r),
      ),
      child: Text(
        label,
        style: AppTypography.badge(context)
            .copyWith(color: AppColors.brandNavy, fontSize: 9.sp),
      ),
    );
  }
}