import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

/// Renders a property image with a graceful fallback.
/// Local mock data currently ships placeholder asset paths (no real files
/// yet), so this always shows a professional placeholder today. Once real
/// assets exist under assets/images/, Image.asset will render them
/// automatically with zero changes to any calling widget — errorBuilder
/// keeps the same fallback if a path is ever missing or a file is corrupt.
class PropertyImage extends StatelessWidget {
  const PropertyImage({required this.assetPath, super.key});

  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => const _ImageFallback(),
    );
  }
}

class _ImageFallback extends StatelessWidget {
  const _ImageFallback();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.border,
      alignment: Alignment.center,
      child: Icon(
        Icons.apartment_rounded,
        size: 40.sp,
        color: AppColors.textSecondary,
      ),
    );
  }
}