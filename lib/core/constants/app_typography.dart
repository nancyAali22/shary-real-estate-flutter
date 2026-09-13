import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

/// Centralized text styles built on the Cairo font family.
/// Methods (not static const) because `.sp` requires ScreenUtil
/// to already be initialized, which happens at runtime, not compile time.
class AppTypography {
  AppTypography._();

  static TextStyle heading1(BuildContext context) => GoogleFonts.cairo(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle heading2(BuildContext context) => GoogleFonts.cairo(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static TextStyle sectionTitle(BuildContext context) => GoogleFonts.cairo(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle body(BuildContext context) => GoogleFonts.cairo(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static TextStyle caption(BuildContext context) => GoogleFonts.cairo(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static TextStyle price(BuildContext context) => GoogleFonts.cairo(
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.brandTeal,
  );

  static TextStyle badge(BuildContext context) => GoogleFonts.cairo(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnAccent,
  );
}