import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../domain/entities/property_listing.dart';
import 'contact_actions_row.dart';
import 'property_image.dart';

/// A single "Featured Project" card: image, verification badge, title,
/// location, and contact actions. Kept purely presentational — it renders
/// whatever [listing] it's given and holds no state of its own.
class FeaturedProjectCard extends StatelessWidget {
  const FeaturedProjectCard({required this.listing, super.key});

  final PropertyListing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.lg.r),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 12.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // AspectRatio ties the image height to the card's own width
          // (16:9), instead of a fixed `.h` value tied to design height.
          // This is what actually caused the tablet overflow: `.w` and
          // `.h` scale by different factors on a screen whose aspect
          // ratio differs from the design reference, so a fixed-width
          // card with a fixed-height image drifted out of proportion.
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              fit: StackFit.expand,
              children: [
                PropertyImage(assetPath: listing.imageAssetPath),
                if (listing.isVerified)
                  Positioned(
                    top: AppSpacing.sm.h,
                    right: AppSpacing.sm.w,
                    child: const _VerifiedBadge(),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.md.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  listing.title,
                  style: AppTypography.sectionTitle(context),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSpacing.xs.h),
                Text(
                  listing.location,
                  style: AppTypography.caption(context),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: AppSpacing.md.h),
                const ContactActionsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.xs.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(AppRadius.sm.r),
      ),
      child: Icon(
        Icons.verified_rounded,
        size: 18.sp,
        color: AppColors.brandTeal,
      ),
    );
  }
}