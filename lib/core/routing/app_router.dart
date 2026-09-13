import 'package:go_router/go_router.dart';

import '../../features/home/presentation/pages/home_page.dart';
import '../widgets/placeholder_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/properties',
        name: 'properties',
        builder: (context, state) =>
        const PlaceholderPage(title: 'عقارات', routeName: 'properties'),
      ),
      GoRoute(
        path: '/properties-abroad',
        name: 'properties-abroad',
        builder: (context, state) => const PlaceholderPage(
          title: 'العقارات في الخارج',
          routeName: 'properties-abroad',
        ),
      ),
      GoRoute(
        path: '/shary-ai',
        name: 'shary-ai',
        builder: (context, state) =>
        const PlaceholderPage(title: 'Shary AI', routeName: 'shary-ai'),
      ),
      GoRoute(
        path: '/more',
        name: 'more',
        builder: (context, state) =>
        const PlaceholderPage(title: 'أخرى', routeName: 'more'),
      ),
    ],
  );
}