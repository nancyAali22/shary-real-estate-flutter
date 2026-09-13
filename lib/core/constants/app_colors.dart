import 'package:flutter/material.dart';

/// Centralized color tokens for the Shary app.
/// Never hardcode a Color value directly in a widget — reference this class instead.
class AppColors {
  AppColors._();

  // Brand
  static const Color brandTeal = Color(0xFF17A9A0);
  static const Color brandNavy = Color(0xFF1B2A4A);
  static const Color brandBlue = Color(0xFF2E5AAC);
  static const Color brandYellow = Color(0xFFF2B705);

  // Backgrounds
  static const Color background = Color(0xFFF6F7F8);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color scaffoldBackground = Color(0xFFF6F7F8);

  // Text
  static const Color textPrimary = Color(0xFF1B2A4A);
  static const Color textSecondary = Color(0xFF6B7A90);
  static const Color textOnAccent = Color(0xFFFFFFFF);

  // Borders / dividers
  static const Color border = Color(0xFFE5E8EC);

  // Semantic
  static const Color success = Color(0xFF25D366); // WhatsApp green
  static const Color error = Color(0xFFE05252);
  static const Color warning = Color(0xFFF2B705);

  // Overlays
  static const Color shadow = Color(0x14000000); // ~8% black
}