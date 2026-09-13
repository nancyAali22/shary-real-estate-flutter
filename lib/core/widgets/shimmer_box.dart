import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_radius.dart';

/// A single skeleton rectangle. Deliberately a plain colored box with no
/// shimmer logic of its own — the shimmer wave is applied once by a
/// Shimmer.fromColors ancestor (see HomeLoadingSkeleton), so the
/// highlight sweeps across the whole skeleton tree as one coherent
/// animation instead of many independent ones.
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    required this.width,
    required this.height,
    this.borderRadius,
    super.key,
  });

  /// Already-scaled width (e.g. `260.w`), same convention as every
  /// other widget in this project — scaling happens at the call site.
  final double width;
  final double height;

  /// Raw AppRadius token (e.g. `AppRadius.lg`); `.r` is applied here.
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular((borderRadius ?? AppRadius.sm).r),
      ),
    );
  }
}