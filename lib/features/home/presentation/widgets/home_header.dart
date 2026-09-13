import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icon_sizes.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/widgets/brand_mark.dart';

/// Home screen header: notification bell, map/location shortcut, brand
/// logo, and profile action. Stateless and static — never rebuilds when
/// HomeCubit emits, since it doesn't depend on any Home data.
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // Forced LTR here on purpose: this header's icon layout is a fixed
    // brand convention (bell/map start, profile end), not text content.
    // Left unforced, the ambient app-wide RTL Directionality reverses
    // this Row's child order (first child renders on the right instead
    // of the left) — which is exactly the "reversed" bug being fixed.
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSpacing.lg.w,
          vertical: AppSpacing.md.h,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _HeaderIconButton(
                    icon: Icons.notifications_none_rounded,
                    hasBadge: true,
                    tooltip: 'الإشعارات',
                    onTap: () {},
                  ),
                  SizedBox(width: AppSpacing.sm.w),
                  _HeaderIconButton(
                    icon: Icons.map_outlined,
                    tooltip: 'الخريطة',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const _BrandLogo(),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: _HeaderIconButton(
                  icon: Icons.person_outline_rounded,
                  tooltip: 'الملف الشخصي',
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandLogo extends StatelessWidget {
  const _BrandLogo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BrandMark(size: AppIconSizes.xl),
        SizedBox(width: AppSpacing.xs.w),
        Text(
          'Shary',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: AppColors.brandNavy,
          ),
        ),
      ],
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.hasBadge = false,
  });

  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final bool hasBadge;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppIconSizes.xl.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.sm.w),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                icon,
                size: AppIconSizes.lg.sp,
                color: AppColors.brandNavy,
              ),
              if (hasBadge)
                Positioned(
                  top: -2.h,
                  right: -2.w,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}