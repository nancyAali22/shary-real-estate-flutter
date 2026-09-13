import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_typography.dart';
import '../../domain/entities/property_listing.dart';
import 'contact_actions_row.dart';
import 'investment_badge.dart';
import 'property_image.dart';

/// A single "Recommended Property" card: full-width, with image,
/// investment badge, title, location, price, resale label, and contact
/// actions. Kept purely presentational, same as FeaturedProjectCard.
class RecommendedPropertyCard extends StatelessWidget {
  const RecommendedPropertyCard({required this.listing, super.key});

  final PropertyListing listing;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180.h,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                PropertyImage(assetPath: listing.imageAssetPath),
                if (listing.isVerified)
                  Positioned(
                    top: AppSpacing.sm.h,
                    right: AppSpacing.sm.w,
                    child: _VerifiedBadge(),
                  ),
                if (listing.investmentReturnPercent != null)
                  Positioned(
                    top: AppSpacing.sm.h,
                    left: AppSpacing.sm.w,
                    child: InvestmentBadge(
                      percent: listing.investmentReturnPercent!,
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSpacing.md.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                if (listing.price != null) ...[
                  SizedBox(height: AppSpacing.sm.h),
                  Text(_formatPrice(listing.price!), style: AppTypography.price(context)),
                ],
                if (listing.resaleLabel != null) ...[
                  SizedBox(height: AppSpacing.sm.h),
                  _ResaleChip(label: listing.resaleLabel!),
                ],
                SizedBox(height: AppSpacing.md.h),
                const ContactActionsRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Mock data currently stores price as an already-formatted string
  /// (e.g. "19,245,492 ج.م"). intl.NumberFormat is applied defensively
  /// here so a future real API returning a raw numeric price only needs
  /// a change in the data layer — this widget's formatting call stays
  /// the same either way.
  String _formatPrice(String rawPrice) {
    final numericPart = rawPrice.replaceAll(RegExp(r'[^\d]'), '');
    if (numericPart.isEmpty) return rawPrice;
    final parsed = int.tryParse(numericPart);
    if (parsed == null) return rawPrice;
    return '${intl.NumberFormat('#,###', 'ar').format(parsed)} ج.م';
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