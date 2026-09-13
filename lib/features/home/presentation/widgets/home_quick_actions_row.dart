import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// "المحفظة" + "تأثيرنا" quick-action cards shown right under the header.
/// Title-only by design (matches the reference): no wallet balance and
/// no subtitle copy, since neither is backed by real data yet.
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
              title: 'المحفظة',
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
    required this.onTap,
    this.iconColor = Colors.white,
  });

  final IconData icon;
  final Color iconBackground;
  final Color iconColor;
  final String title;
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
              child: Text(
                title,
                style: AppTypography.sectionTitle(
                  context,
                ).copyWith(fontSize: 14.sp),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}