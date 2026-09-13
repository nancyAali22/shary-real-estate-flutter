import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shary_real_estate/features/home/domain/entities/share_service.dart';
import 'package:shary_real_estate/features/home/presentation/widgets/share_services_section.dart';

Widget _wrap(Widget child) {
  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, _) => MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(body: child),
      ),
    ),
  );
}

void main() {
  testWidgets('renders the banner and every service title, including a badge', (
      tester,
      ) async {
    const services = [
      ShareService(
        id: 's1',
        title: 'احجز مع المطوّر',
        subtitle: 'وصف',
        iconAssetPath: 'assets/icons/book_developer.png',
      ),
      ShareService(
        id: 's2',
        title: 'فرص إعادة بيع حصرية',
        subtitle: 'وصف',
        iconAssetPath: 'assets/icons/resale.png',
        highlightBadge: '40% UNDER MARKET',
      ),
    ];

    await tester.pumpWidget(_wrap(const ShareServicesSection(services: services)));

    expect(find.text('Shary Ma3ak'), findsOneWidget);
    expect(find.text('احجز مع المطوّر'), findsOneWidget);
    expect(find.text('40% UNDER MARKET'), findsOneWidget);
  });

  testWidgets('renders nothing visible when there are no services', (tester) async {
    await tester.pumpWidget(_wrap(const ShareServicesSection(services: [])));

    expect(find.text('Shary Ma3ak'), findsNothing);
  });
}