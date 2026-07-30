import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/shared/widgets/marketing_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return MarketingPageScaffold(
      activeRoute: AppRoutes.services,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PageHero(
            eyebrow: context.l10n.servicesEyebrow,
            title: context.l10n.servicesTitle,
            subtitle: context.l10n.servicesSubtitle,
          ),
          const SizedBox(height: 56),
          _SectionTitle(
              title: context.l10n.servicesWhatWeDeliverTitle,
              subtitle: context.l10n.servicesWhatWeDeliverSubtitle),
          const SizedBox(height: 28),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              _ServiceCard(
                icon: Icons.smartphone_rounded,
                title: context.l10n.servicesCardAppsTitle,
                description: context.l10n.servicesCardAppsDesc,
                highlight: context.l10n.servicesCardAppsHighlight,
                color: AppColors.primary,
              ),
              _ServiceCard(
                icon: Icons.web_rounded,
                title: context.l10n.servicesCardWebTitle,
                description: context.l10n.servicesCardWebDesc,
                highlight: context.l10n.servicesCardWebHighlight,
                color: AppColors.secondary,
              ),
              _ServiceCard(
                icon: Icons.hub_rounded,
                title: context.l10n.servicesCardIntegrationsTitle,
                description: context.l10n.servicesCardIntegrationsDesc,
                highlight: context.l10n.servicesCardIntegrationsHighlight,
                color: AppColors.accent,
              ),
              _ServiceCard(
                icon: Icons.design_services_rounded,
                title: context.l10n.servicesCardDesignTitle,
                description: context.l10n.servicesCardDesignDesc,
                highlight: context.l10n.servicesCardDesignHighlight,
                color: AppColors.secondary,
              ),
            ],
          ),
          const SizedBox(height: 72),
          _SectionTitle(
              title: context.l10n.servicesProcessTitle,
              subtitle: context.l10n.servicesProcessSubtitle),
          const SizedBox(height: 28),
          _ProcessTimeline(isDesktop: isDesktop),
          const SizedBox(height: 72),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 28 : 44),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(color: AppColors.surfaceHighlight, width: 1),
              gradient: LinearGradient(
                colors: [
                  AppColors.surface.withValues(alpha: 0.9),
                  AppColors.background
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.l10n.servicesCtaTitle,
                          style: context.textStyles.headlineSmall),
                      const SizedBox(height: 10),
                      Text(
                        context.l10n.servicesCtaBody,
                        style: context.textStyles.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                if (!isMobile)
                  ElevatedButton(
                    onPressed: () => context.push(AppRoutes.consultation),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 18)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            color: AppColors.background),
                        SizedBox(width: 10),
                        Text(context.l10n.servicesCtaButton),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (isMobile) ...[
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () => context.push(AppRoutes.consultation),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 28, vertical: 18)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.calendar_month_rounded,
                        color: AppColors.background),
                    SizedBox(width: 10),
                    Text(context.l10n.navScheduleFreeConsultation),
                  ],
                ),
              ).animate().fadeIn(duration: 450.ms).slideX(begin: 0.06, end: 0),
            ),
          ],
        ],
      ),
    );
  }
}

class _PageHero extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;

  const _PageHero(
      {required this.eyebrow, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 26 : 44),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: AppColors.surfaceHighlight),
        image: DecorationImage(
          image: const AssetImage(
              'assets/images/modern_tech_startup_blue_1774235982676.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              AppColors.background.withValues(alpha: 0.82), BlendMode.darken),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.surfaceHighlight.withValues(alpha: 0.75),
              borderRadius: BorderRadius.circular(100),
              border:
                  Border.all(color: AppColors.primary.withValues(alpha: 0.25)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  eyebrow,
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      letterSpacing: 1.6),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.15, end: 0),
          const SizedBox(height: 20),
          Text(title,
              style: (isMobile
                  ? context.textStyles.displaySmall
                  : context.textStyles.displayMedium)),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Text(subtitle,
                style: context.textStyles.bodyLarge
                    ?.copyWith(color: AppColors.textSecondary, height: 1.6)),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.textStyles.headlineLarge),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 760),
          child: Text(subtitle, style: context.textStyles.bodyLarge),
        ),
      ],
    ).animate().fadeIn(duration: 450.ms);
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String highlight;
  final Color color;

  const _ServiceCard(
      {required this.icon,
      required this.title,
      required this.description,
      required this.highlight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: color.withValues(alpha: 0.28)),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(highlight,
                    style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w800,
                        color: color,
                        letterSpacing: 0.4)),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(title,
              style: context.textStyles.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 12),
          Text(description, style: context.textStyles.bodyMedium),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms).slideY(begin: 0.06, end: 0);
  }
}

class _ProcessTimeline extends StatelessWidget {
  final bool isDesktop;
  const _ProcessTimeline({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = [
      _TimelineItem(
          icon: Icons.map_rounded,
          title: l10n.servicesTimelineDiagnosisTitle,
          desc: l10n.servicesTimelineDiagnosisDesc),
      _TimelineItem(
          icon: Icons.grid_view_rounded,
          title: l10n.servicesTimelineUxTitle,
          desc: l10n.servicesTimelineUxDesc),
      _TimelineItem(
          icon: Icons.rocket_launch_rounded,
          title: l10n.servicesTimelineBuildTitle,
          desc: l10n.servicesTimelineBuildDesc),
      _TimelineItem(
          icon: Icons.auto_graph_rounded,
          title: l10n.servicesTimelineEvolveTitle,
          desc: l10n.servicesTimelineEvolveDesc),
    ];

    if (!isDesktop) {
      return Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _TimelineCard(item: items[i], index: i),
            if (i != items.length - 1) const SizedBox(height: 16),
          ]
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < items.length; i++) ...[
          Expanded(child: _TimelineCard(item: items[i], index: i)),
          if (i != items.length - 1) const SizedBox(width: 16),
        ],
      ],
    );
  }
}

class _TimelineItem {
  final IconData icon;
  final String title;
  final String desc;
  const _TimelineItem(
      {required this.icon, required this.title, required this.desc});
}

class _TimelineCard extends StatelessWidget {
  final _TimelineItem item;
  final int index;
  const _TimelineCard({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final accent = [
      AppColors.primary,
      AppColors.secondary,
      AppColors.accent,
      AppColors.primary
    ][index % 4];
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: accent.withValues(alpha: 0.28)),
                ),
                child: Icon(item.icon, color: accent, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(item.title,
                      style: context.textStyles.titleLarge
                          ?.copyWith(fontWeight: FontWeight.w800))),
            ],
          ),
          const SizedBox(height: 12),
          Text(item.desc, style: context.textStyles.bodyMedium),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 450.ms, delay: (70 * index).ms)
        .slideY(begin: 0.06, end: 0);
  }
}
