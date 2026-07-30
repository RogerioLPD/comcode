import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/shared/widgets/marketing_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Shared scaffold for internal marketing pages.
/// Keeps the same look-and-feel as the landing page (dark, neon, glassy sections).
class MarketingPageScaffold extends StatelessWidget {
  final String activeRoute;
  final Widget child;
  final ScrollController? scrollController;

  const MarketingPageScaffold(
      {super.key,
      required this.activeRoute,
      required this.child,
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    final controller = scrollController ?? ScrollController();
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MarketingAppBar(
        scrollController: controller,
        showBackToHome: activeRoute != AppRoutes.home,
        activeRoute: activeRoute,
      ),
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: isMobile ? 140 : 170,
                  left: isMobile ? 24 : 64,
                  right: isMobile ? 24 : 64,
                  bottom: 40),
              child: child,
            ).animate().fadeIn(duration: 450.ms),
            const _MarketingFooter(),
          ],
        ),
      ),
    );
  }
}

class _MarketingFooter extends StatelessWidget {
  const _MarketingFooter();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding:
          EdgeInsets.symmetric(horizontal: isMobile ? 24 : 64, vertical: 48),
      child: Column(
        children: [
          const Divider(color: AppColors.surfaceHighlight),
          const SizedBox(height: 24),
          Text(
            context.l10n.footerRights(DateTime.now().year.toString()),
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall
                ?.copyWith(color: AppColors.textSecondary),
          ),
        ],
      ),
    );
  }
}
