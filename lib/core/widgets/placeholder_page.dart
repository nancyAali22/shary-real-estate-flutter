import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_spacing.dart';
import '../constants/app_typography.dart';


/// A visually consistent placeholder for sections not yet implemented.
/// Reused across all bottom-navigation tabs other than Home.
class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title, style: AppTypography.heading2(context))),
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
    );
  }
}