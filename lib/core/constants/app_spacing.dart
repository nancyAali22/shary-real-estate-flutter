/// Raw spacing values. Apply `.w` / `.h` at the usage site
/// (e.g. `SizedBox(height: AppSpacing.md.h)`), not here,
/// since ScreenUtil extensions require an active BuildContext.
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
}