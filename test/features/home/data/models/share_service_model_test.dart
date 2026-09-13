import 'package:flutter_test/flutter_test.dart';
import 'package:shary_real_estate/features/home/data/models/share_service_model.dart';
import 'package:shary_real_estate/features/home/domain/entities/share_service.dart';

void main() {
  group('ShareServiceModel', () {
    test('is a ShareService', () {
      const model = ShareServiceModel(
        id: 'svc_099',
        title: 'خدمة تجريبية',
        subtitle: 'وصف',
        iconAssetPath: 'assets/icons/test.png',
      );

      expect(model, isA<ShareService>());
    });

    test('fromJson parses optional highlightBadge when present and absent', () {
      final withBadge = ShareServiceModel.fromJson({
        'id': 'svc_002',
        'title': 'فرص إعادة بيع حصرية',
        'subtitle': 'وحدات مميزة بأقل سعر من السوق',
        'iconAssetPath': 'assets/icons/resale.png',
        'highlightBadge': '40% UNDER MARKET',
      });
      final withoutBadge = ShareServiceModel.fromJson({
        'id': 'svc_003',
        'title': 'مؤشر شاري',
        'subtitle': 'مؤشر سوق العقارات',
        'iconAssetPath': 'assets/icons/market_index.png',
      });

      expect(withBadge.highlightBadge, '40% UNDER MARKET');
      expect(withoutBadge.highlightBadge, isNull);
    });
  });
}