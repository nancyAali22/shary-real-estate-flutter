import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/brand_mark.dart';
import '../../domain/entities/share_service.dart';
import 'share_service_card.dart';

/// "Shary Ma3ak" section: a brand banner followed by a 2-column grid of
/// service tiles. Laid out as plain Rows (not GridView.builder) because
/// the dataset is small and fixed — same reasoning as
/// RecommendedPropertiesSection: this already lives inside the page's
/// single outer ListView, so a second independently-scrolling widget
/// here would create ambiguous scroll physics for no real benefit.
class ShareServicesSection extends StatelessWidget {
  const ShareServicesSection({required this.services, super.key});

  final List<ShareService> services;

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _ShareMa3akBanner(),
          SizedBox(height: AppSpacing.md.h),
          for (var i = 0; i < services.length; i += 2) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: ShareServiceCard(service: services[i])),
                SizedBox(width: AppSpacing.md.w),
                Expanded(
                  child: i + 1 < services.length
                      ? ShareServiceCard(service: services[i + 1])
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            if (i + 2 < services.length) SizedBox(height: AppSpacing.md.h),
          ],
        ],
      ),
    );
  }
}

class _ShareMa3akBanner extends StatelessWidget {
  const _ShareMa3akBanner();

  @override
  Widget build(BuildContext context) {
    // Forced LTR here on purpose: the banner copy is English brand
    // copy ("Shary Ma3ak" / "furnishing, renting, and resale"), so it
    // must start from the left, with the brand mark on the right —
    // left unforced, the ambient app-wide RTL Directionality reverses
    // this Row's child order instead.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: EdgeInsets.all(AppSpacing.lg.w),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shary Ma3ak', style: AppTypography.heading2(context)),
                  SizedBox(height: AppSpacing.xs.h),
                  Text(
                    'furnishing, renting, and resale',
                    style: AppTypography.caption(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSpacing.md.w),
            const BrandMark(size: 52),
          ],
        ),
      ),
    );
  }
}