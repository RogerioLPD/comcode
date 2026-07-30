import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:comcode/features/cases/presentation/pages/case_detail_page.dart';
import 'package:comcode/features/cases/presentation/pages/cases_page.dart';
import 'package:comcode/features/consultation/presentation/pages/consultation_page.dart';
import 'package:comcode/features/differentials/presentation/pages/differentials_page.dart';
import 'package:comcode/features/home/presentation/pages/home_page.dart';
import 'package:comcode/features/services/presentation/pages/services_page.dart';

/// GoRouter configuration for app navigation
///
/// This uses go_router for declarative routing, which provides:
/// - Type-safe navigation
/// - Deep linking support (web URLs, app links)
/// - Easy route parameters
/// - Navigation guards and redirects
///
/// To add a new route:
/// 1. Add a route constant to AppRoutes below
/// 2. Add a GoRoute to the routes list
/// 3. Navigate using context.go() or context.push()
/// 4. Use context.pop() to go back.
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: HomePage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.services,
        name: 'services',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const ServicesPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.differentials,
        name: 'differentials',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const DifferentialsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.cases,
        name: 'cases',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const CasesPage(),
        ),
        routes: [
          GoRoute(
            path: ':id',
            name: 'case_detail',
            pageBuilder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              return _fadeSlidePage(
                key: state.pageKey,
                child: CaseDetailPage(caseId: id),
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.consultation,
        name: 'consultation',
        pageBuilder: (context, state) => _fadeSlidePage(
          key: state.pageKey,
          child: const ConsultationPage(),
        ),
      ),
    ],
  );
}

CustomTransitionPage<void> _fadeSlidePage(
    {required LocalKey key, required Widget child}) {
  return CustomTransitionPage<void>(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curved =
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic);
      return FadeTransition(
        opacity: curved,
        child: SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0, 0.03), end: Offset.zero)
                  .animate(curved),
          child: child,
        ),
      );
    },
  );
}

/// Route path constants
/// Use these instead of hard-coding route strings
class AppRoutes {
  static const String home = '/';
  static const String services = '/servicos';
  static const String differentials = '/diferenciais';
  static const String cases = '/cases';
  static const String consultation = '/consultoria';
}
