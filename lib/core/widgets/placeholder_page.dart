import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../theme/app_typography.dart';
import 'app_bottom_nav.dart';

/// A visually consistent placeholder for sections not yet implemented.
/// Reused across all bottom-navigation tabs other than Home.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    required this.title,
    required this.routeName,
    super.key,
  });

  final String title;

  /// Needed so [AppBottomNav] knows which tab to highlight, and so this
  /// page can appear consistent with Home's own Scaffold structure.
  final String routeName;

  @override
  Widget build(BuildContext context) {
    // Root cause of the "back button exits the app" bug: these tabs are
    // reached via `context.goNamed(...)`, which replaces the current
    // location instead of pushing it — so there's no back-stack entry
    // for the system back button to pop to. PopScope intercepts that
    // pop attempt and sends the user to Home explicitly instead.
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.goNamed('home');
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            tooltip: 'الرجوع للرئيسية',
            onPressed: () => context.goNamed('home'),
          ),
          title: Text(title, style: AppTypography.heading2(context)),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.construction_outlined,
                  size: 48.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(height: AppSpacing.lg.h),
                Text(
                  'قريبًا',
                  style: AppTypography.heading2(context),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: AppSpacing.sm.h),
                Text(
                  'هذا القسم غير متصل حاليًا بأي خدمة خلفية، وسيتم تفعيله لاحقًا.',
                  style: AppTypography.body(context),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AppBottomNav(currentRouteName: routeName),
      ),
    );
  }
}