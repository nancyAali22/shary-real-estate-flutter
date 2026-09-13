import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/property_listing.dart';
import 'contact_actions_row.dart';
import 'investment_badge.dart';
import 'property_image.dart';

class RecommendedPropertyCard extends StatelessWidget {
  const RecommendedPropertyCard({required this.listing, super.key});

  final PropertyListing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(
            height: 180.h,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                PropertyImage(assetPath: listing.imageAssetPath),
                // Small verified/shield badge sits top-left, matching
                // the reference — previously this was on the right,
                // swapped with the investment ribbon by mistake.
                if (listing.isVerified)
                  Positioned(
                    top: AppSpacing.sm.h,
                    left: AppSpacing.sm.w,
                    child: const _VerifiedBadge(),
                  ),
                if (listing.investmentReturnPercent != null)
                  Positioned(
                    top: AppSpacing.sm.h,
                    right: AppSpacing.sm.w,
                    child: const InvestmentBadge(),
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
                _LocationRow(location: listing.location),
                if (listing.price != null) ...[
                  SizedBox(height: AppSpacing.sm.h),
                  Text(
                    _formatPrice(listing.price!),
                    style: AppTypography.price(context),
                  ),
                ],
                SizedBox(height: AppSpacing.md.h),
                const ContactActionsRow(),
                if (listing.resaleLabel != null ||
                    listing.investmentReturnPercent != null) ...[
                  SizedBox(height: AppSpacing.sm.h),
                  // Content-sized chips pushed to opposite ends of the
                  // row — same "far right / far left with a real gap"
                  // treatment as ContactActionsRow, instead of sitting
                  // stacked close together.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (listing.resaleLabel != null)
                        _ResaleChip(label: listing.resaleLabel!),
                      if (listing.investmentReturnPercent != null)
                        _InvestmentPercentChip(
                          percent: listing.investmentReturnPercent!,
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatPrice(String rawPrice) {
    final numericPart = rawPrice.replaceAll(RegExp(r'[^\d]'), '');
    if (numericPart.isEmpty) return rawPrice;
    final parsed = int.tryParse(numericPart);
    if (parsed == null) return rawPrice;
    return '${intl.NumberFormat('#,###', 'ar').format(parsed)} ج.م';
  }
}

/// Location line with a pin icon. `mainAxisSize.min` + `Flexible` (not
/// Expanded) so the row only takes the width its content needs — an
/// Expanded here was what previously stretched the row and added dead
/// space, growing the card taller than necessary.
class _LocationRow extends StatelessWidget {
  const _LocationRow({required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on_outlined,
          size: 14.sp,
          color: AppColors.textSecondary,
        ),
        SizedBox(width: AppSpacing.xs.w),
        Flexible(
          child: Text(
            location,
            style: AppTypography.caption(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
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

class _ResaleChip extends StatelessWidget {
  const _ResaleChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm.w,
        vertical: AppSpacing.xs.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppRadius.sm.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(label, style: AppTypography.caption(context)),
    );
  }
}

class _InvestmentPercentChip extends StatelessWidget {
  const _InvestmentPercentChip({required this.percent});

  final int percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.sm.w,
        vertical: AppSpacing.xs.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.brandTeal.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(AppRadius.sm.r),
      ),
      child: Text(
        'عائد الاستثمار $percent%',
        style: AppTypography.caption(
          context,
        ).copyWith(color: AppColors.brandTeal, fontWeight: FontWeight.w700),
      ),
    );
  }
}