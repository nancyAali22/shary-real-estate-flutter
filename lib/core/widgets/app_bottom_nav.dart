import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants/app_colors.dart';
import '../constants/app_icon_sizes.dart';
import '../theme/app_typography.dart';

/// Shared bottom navigation bar. Each tab navigates via named routes
/// (see AppRouter) so the current tab is derived from the route name,
/// not from local widget state — keeping navigation state in one place.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({required this.currentRouteName, super.key});

  final String currentRouteName;

  static const _tabs = <_NavTab>[
    _NavTab(routeName: 'more', label: 'أخرى', icon: Icons.more_horiz_rounded),
    _NavTab(
      routeName: 'shary-ai',
      label: 'Shary AI',
      icon: Icons.auto_awesome_outlined,
    ),
    _NavTab(
      routeName: 'properties-abroad',
      label: 'العقارات في الخارج',
      icon: Icons.public_outlined,
    ),
    _NavTab(
      routeName: 'properties',
      label: 'عقارات',
      icon: Icons.apartment_outlined,
    ),
    _NavTab(routeName: 'home', label: 'الرئيسية', icon: Icons.home_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = _tabs.indexWhere(
          (tab) => tab.routeName == currentRouteName,
    );

    return SafeArea(
      top: false,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 12.r,
                offset: Offset(0, -2.h),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: GNav(
              gap: 4.w,
              selectedIndex: currentIndex < 0 ? 0 : currentIndex,
              activeColor: AppColors.brandTeal,
              color: AppColors.textSecondary,
              tabBackgroundColor: AppColors.brandTeal.withValues(alpha: 0.1),
              iconSize: AppIconSizes.lg.sp,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              tabBorderRadius: 16.r,
              textStyle: AppTypography.caption(context).copyWith(
                color: AppColors.brandTeal,
                fontWeight: FontWeight.w600,
              ),
              tabs: [
                for (final tab in _tabs)
                  GButton(icon: tab.icon, text: tab.label),
              ],
              onTabChange: (index) {
                final tapped = _tabs[index];
                if (tapped.routeName != currentRouteName) {
                  context.goNamed(tapped.routeName);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NavTab {
  const _NavTab({
    required this.routeName,
    required this.label,
    required this.icon,
  });

  final String routeName;
  final String label;
  final IconData icon;
}