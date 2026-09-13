import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/di/injection_container.dart';
import '../../../../core/widgets/app_bottom_nav.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import '../widgets/featured_projects_section.dart';
import '../widgets/home_header.dart';
import '../widgets/home_loading_skeleton.dart';
import '../widgets/home_quick_actions_row.dart';
import '../widgets/recommended_properties_section.dart';
import '../widgets/share_services_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<HomeCubit>()..loadHome(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const HomeHeader(),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) => _HomeBody(state: state),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(currentRouteName: 'home'),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return switch (state) {
      HomeInitial() || HomeLoading() => const _LoadingPlaceholder(),
      HomeLoaded loaded => _HomeContent(state: loaded),
      HomeEmpty() => const _EmptyPlaceholder(),
      HomeError(:final message) => _ErrorPlaceholder(message: message),
    };
  }
}

class _LoadingPlaceholder extends StatelessWidget {
  const _LoadingPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const HomeLoadingSkeleton();
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({required this.state});

  final HomeLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: AppSpacing.xl.h),
      children: [
        SizedBox(height: AppSpacing.sm.h),
        const HomeQuickActionsRow(),
        SizedBox(height: AppSpacing.lg.h),
        FeaturedProjectsSection(projects: state.featuredProjects),
        SizedBox(height: AppSpacing.xl.h),
        RecommendedPropertiesSection(properties: state.recommendedProperties),
        SizedBox(height: AppSpacing.xl.h),
        ShareServicesSection(services: state.shareServices),
      ],
    );
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48.sp,
            color: AppColors.textSecondary,
          ),
          SizedBox(height: AppSpacing.lg.h),
          Text(
            'لا توجد بيانات لعرضها حاليًا',
            style: AppTypography.heading2(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErrorPlaceholder extends StatelessWidget {
  const _ErrorPlaceholder({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.xl.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline_rounded,
            size: 48.sp,
            color: AppColors.error,
          ),
          SizedBox(height: AppSpacing.lg.h),
          Text(
            message,
            style: AppTypography.body(context),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.lg.h),
          FilledButton(
            onPressed: () => context.read<HomeCubit>().loadHome(),
            child: const Text('إعادة المحاولة'),
          ),
        ],
      ),
    );
  }
}