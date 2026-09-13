import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';

/// The Shary brand mark: three overlapping colored circles (navy, teal,
/// yellow). This is the single source of truth for the logo — used both
/// next to the "Shary" wordmark in [HomeHeader] and in the Shary Ma3ak
/// banner, so the two never drift into different-looking logos.
class BrandMark extends StatelessWidget {
  const BrandMark({this.size = 32, super.key});

  /// Overall bounding box size (width == height) before .w scaling.
  final double size;

  @override
  Widget build(BuildContext context) {
    final boxSize = size.w;
    final dotSize = boxSize * 0.5;

    return SizedBox(
      width: boxSize,
      height: boxSize,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: boxSize * 0.15,
            child: _dot(dotSize, AppColors.brandNavy),
          ),
          Positioned(
            right: 0,
            top: boxSize * 0.15,
            child: _dot(dotSize, AppColors.brandTeal),
          ),
          Positioned(
            bottom: 0,
            left: boxSize * 0.25,
            child: _dot(dotSize, AppColors.brandYellow),
          ),
        ],
      ),
    );
  }

  Widget _dot(double dotSize, Color color) => Container(
    width: dotSize,
    height: dotSize,
    decoration: BoxDecoration(color: color, shape: BoxShape.circle),
  );
}