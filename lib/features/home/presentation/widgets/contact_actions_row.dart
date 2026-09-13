import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';

/// WhatsApp + phone contact buttons shown on property cards.
/// No real backend/telephony integration yet — taps show a SnackBar
/// explaining the feature isn't wired up, consistent with how the
/// bottom-nav placeholders communicate "not connected yet".
class ContactActionsRow extends StatelessWidget {
  const ContactActionsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ContactButton(
          icon: Icons.chat_bubble_rounded,
          backgroundColor: AppColors.success,
          tooltip: 'واتساب',
          onTap: () => _showNotConnectedMessage(context, 'واتساب'),
        ),
        SizedBox(width: AppSpacing.sm.w),
        _ContactButton(
          icon: Icons.call_rounded,
          backgroundColor: AppColors.brandNavy,
          tooltip: 'اتصال',
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

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    required this.icon,
    required this.backgroundColor,
    required this.tooltip,
    required this.onTap,
  });

  final IconData icon;
  final Color backgroundColor;
  final String tooltip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.md.r),
        onTap: onTap,
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(AppRadius.md.r),
          ),
          child: Icon(icon, color: AppColors.textOnAccent, size: 20.sp),
        ),
      ),
    );
  }
}