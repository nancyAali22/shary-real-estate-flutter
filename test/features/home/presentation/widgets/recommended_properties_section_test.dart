import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shary_real_estate/features/home/domain/entities/property_listing.dart';
import 'package:shary_real_estate/features/home/presentation/widgets/recommended_properties_section.dart';

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
  testWidgets('renders a card and its title for each property', (tester) async {
    const properties = [
      PropertyListing(
        id: 'rp_1',
        title: 'مكاتب - كمبوند سراي القاهرة الجديدة',
        location: 'القاهرة الجديدة',
        imageAssetPath: 'assets/images/recommended_sarai.jpg',
        listingType: ListingType.recommended,
        price: '19,245,492 ج.م',
      ),
    ];

    await tester.pumpWidget(
      _wrap(const RecommendedPropertiesSection(properties: properties)),
    );

    expect(find.text('مكاتب - كمبوند سراي القاهرة الجديدة'), findsOneWidget);
    expect(find.text('الوحدات الموصى بها'), findsOneWidget);
  });

  testWidgets('renders nothing visible when the list is empty', (tester) async {
    await tester.pumpWidget(
      _wrap(const RecommendedPropertiesSection(properties: [])),
    );

    expect(find.text('الوحدات الموصى بها'), findsNothing);
  });
}