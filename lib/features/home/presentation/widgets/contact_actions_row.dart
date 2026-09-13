import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';

/// WhatsApp + phone contact buttons shown on property cards.
/// No real backend/telephony integration yet — taps show a SnackBar
/// explaining the feature isn't wired up.
class ContactActionsRow extends StatelessWidget {
  const ContactActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    // Content-sized buttons pushed to opposite ends of the row (not
    // Expanded/flex filling contiguous space) — this one at the far
    // right, that one at the far left, with a real gap between them.
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _PillButton(
          icon: Icons.chat_bubble_rounded,
          label: 'تواصل واتساب',
          backgroundColor: AppColors.success,
          foregroundColor: Colors.white,
          borderColor: AppColors.success,
          onTap: () => _showNotConnectedMessage(context, 'واتساب'),
        ),
        _PillButton(
          icon: Icons.call_rounded,
          label: 'اتصل',
          backgroundColor: AppColors.cardBackground,
          foregroundColor: AppColors.brandNavy,
          borderColor: AppColors.border,
          onTap: () => _showNotConnectedMessage(context, 'الاتصال'),
        ),
      ],
    );
  }

  void _showNotConnectedMessage(BuildContext context, String action) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('ميزة $action غير متصلة بخدمة حقيقية حاليًا')),
    );
  }
}

class _PillButton extends StatelessWidget {
  const _PillButton({
    required this.icon,
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderColor,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.pill.r),
        onTap: onTap,
        child: Container(
          height: 40.h,
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.sm.w),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppRadius.pill.r),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: AppTypography.caption(
                    context,
                  ).copyWith(color: foregroundColor, fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: AppSpacing.xs.w),
              Icon(icon, color: foregroundColor, size: 16.sp),
            ],
          ),
        ),
      ),
    );
  }
}