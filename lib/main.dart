import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/injection_container.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  setupDependencyInjection();
  runApp(const SharyApp());
}

class SharyApp extends StatelessWidget {
  const SharyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Shary Real Estate',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          routerConfig: AppRouter.router,
          builder: (context, child) {
            // Clamp system font scaling app-wide. Without this, a device
            // with a large accessibility font size can push text past
            // what a fixed-height card (e.g. FeaturedProjectCard inside
            // a horizontal ListView) was sized for, causing a RenderFlex
            // overflow. minScaleFactor keeps "shrink text" fully usable;
            // maxScaleFactor still gives real benefit to "enlarge text"
            // users without breaking any fixed-height layout in the app.
            return MediaQuery.withClampedTextScaling(
              minScaleFactor: 1.0,
              maxScaleFactor: 1.3,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: child ?? const SizedBox.shrink(),
              ),
            );
          },
        );
      },
    );
  }
}