import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// "محفظتي" + "تأثيرنا" quick-action cards shown right under the header.
/// Static/decorative for now — the wallet balance is a mock display value,
/// not real user data, so it lives here rather than in the domain layer.
class HomeQuickActionsRow extends StatelessWidget {
  const HomeQuickActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg.w),
      child: Row(
        children: [
          Expanded(
            child: _QuickActionCard(
              icon: Icons.account_balance_wallet_rounded,
              iconBackground: AppColors.brandTeal,
              title: 'محفظتي',
              subtitle: '19,245.49 ج.م',
              onTap: () {},
            ),
          ),
          SizedBox(width: AppSpacing.md.w),
          Expanded(
            child: _QuickActionCard(
              icon: Icons.favorite_border_rounded,
              iconBackground: Colors.transparent,
              iconColor: AppColors.brandTeal,
              title: 'تأثيرنا',
              subtitle: 'معًا نبني مستقبل أفضل',
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  const _QuickActionCard({
    required this.icon,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.iconColor = Colors.white,
  });

  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.lg.r),
      child: Container(
        padding: EdgeInsets.all(AppSpacing.md.w),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(AppRadius.lg.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: iconBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: iconColor, size: 18.sp),
            ),
            SizedBox(width: AppSpacing.sm.w),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: AppTypography.caption(context),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subtitle,
                    style: AppTypography.sectionTitle(
                      context,
                    ).copyWith(fontSize: 13.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}