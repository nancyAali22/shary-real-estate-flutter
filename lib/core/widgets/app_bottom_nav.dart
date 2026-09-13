import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_icon_sizes.dart';
import '../constants/app_typography.dart';

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
    return SafeArea(
      top: false,
      child: Container(
        height: 64.h,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (final tab in _tabs)
              _NavItem(
                tab: tab,
                isSelected: tab.routeName == currentRouteName,
                onTap: () {
                  if (tab.routeName != currentRouteName) {
                    context.goNamed(tab.routeName);
                  }
                },
              ),
          ],
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

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
  });

  final _NavTab tab;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.brandTeal : AppColors.textSecondary;
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tab.icon, size: AppIconSizes.lg.sp, color: color),
            SizedBox(height: 2.h),
            Text(
              tab.label,
              style: AppTypography.caption(context).copyWith(color: color),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}