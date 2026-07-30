import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/shared/widgets/marketing_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comcode/core/localization/site_strings.dart';

class DifferentialsPage extends StatelessWidget {
  const DifferentialsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;

    return MarketingPageScaffold(
      activeRoute: AppRoutes.differentials,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Hero(),
          const SizedBox(height: 56),
          Text(context.l10n.diffSectionTitle,
                  style: context.textStyles.headlineLarge)
              .animate()
              .fadeIn(duration: 450.ms),
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              context.l10n.diffSectionSubtitle,
              style: context.textStyles.bodyLarge,
            ),
          ).animate().fadeIn(duration: 450.ms, delay: 80.ms),
          const SizedBox(height: 28),
          _DifferentialsGrid(isDesktop: isDesktop),
          const SizedBox(height: 72),
          _ProofStrip(isDesktop: isDesktop),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 26 : 44),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: AppColors.surfaceHighlight),
        gradient: LinearGradient(
          colors: [AppColors.surface, AppColors.background],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceHighlight,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: AppColors.secondary.withValues(alpha: 0.25)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.verified_rounded,
                          size: 16, color: AppColors.secondary),
                      const SizedBox(width: 8),
                      Text(
                        l10n.diffEyebrow,
                        style: GoogleFonts.outfit(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: AppColors.secondary,
                            letterSpacing: 1.6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(l10n.diffHeroTitle,
                    style: isMobile
                        ? context.textStyles.displaySmall
                        : context.textStyles.displayMedium),
                const SizedBox(height: 14),
                Text(
                  l10n.diffHeroSubtitle,
                  style: context.textStyles.bodyLarge,
                ),
              ],
            ),
          ),
          if (!isMobile) ...[
            const SizedBox(width: 18),
            _NeonBadgeStack(),
          ],
        ],
      ),
    ).animate().fadeIn(duration: 450.ms).slideY(begin: 0.04, end: 0);
  }
}

class _NeonBadgeStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: 240,
      height: 180,
      child: Stack(
        children: [
          _Badge(
            icon: Icons.speed_rounded,
            title: l10n.diffBadgeSpeedTitle,
            subtitle: l10n.diffBadgeSpeedSubtitle,
            color: AppColors.primary,
            top: 0,
            left: 0,
          ),
          _Badge(
            icon: Icons.shield_rounded,
            title: l10n.diffBadgeSecurityTitle,
            subtitle: l10n.diffBadgeSecuritySubtitle,
            color: AppColors.accent,
            top: 60,
            left: 80,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms).slideX(begin: 0.08, end: 0);
  }
}

class _Badge extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final double top;
  final double left;
  const _Badge(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.color,
      required this.top,
      required this.left});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withValues(alpha: 0.5)),
          boxShadow: [
            BoxShadow(
                color: color.withValues(alpha: 0.12),
                blurRadius: 30,
                offset: const Offset(0, 14))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 10),
            Text(title,
                style: GoogleFonts.outfit(
                    fontWeight: FontWeight.w900, color: AppColors.textPrimary)),
            const SizedBox(height: 2),
            Text(subtitle,
                style: GoogleFonts.inter(
                    fontSize: 12, color: AppColors.textSecondary, height: 1.2)),
          ],
        ),
      ),
    );
  }
}

class _DifferentialsGrid extends StatelessWidget {
  final bool isDesktop;
  const _DifferentialsGrid({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final items = [
      _DiffItem(
          icon: Icons.track_changes_rounded,
          title: l10n.diffItemClarityTitle,
          desc: l10n.diffItemClarityDesc),
      _DiffItem(
          icon: Icons.schema_rounded,
          title: l10n.diffItemArchitectureTitle,
          desc: l10n.diffItemArchitectureDesc),
      _DiffItem(
          icon: Icons.auto_fix_high_rounded,
          title: l10n.diffItemDesignTitle,
          desc: l10n.diffItemDesignDesc),
      _DiffItem(
          icon: Icons.sync_alt_rounded,
          title: l10n.diffItemCommunicationTitle,
          desc: l10n.diffItemCommunicationDesc),
      _DiffItem(
          icon: Icons.rocket_launch_rounded,
          title: l10n.diffItemDeliveryTitle,
          desc: l10n.diffItemDeliveryDesc),
      _DiffItem(
          icon: Icons.bug_report_rounded,
          title: l10n.diffItemQualityTitle,
          desc: l10n.diffItemQualityDesc),
    ];

    final crossAxisCount = isDesktop ? 3 : 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 18.0;
        final itemWidth =
            (constraints.maxWidth - (crossAxisCount - 1) * spacing) /
                crossAxisCount;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (int i = 0; i < items.length; i++)
              SizedBox(
                  width: itemWidth, child: _DiffCard(item: items[i], index: i)),
          ],
        );
      },
    );
  }
}

class _DiffItem {
  final IconData icon;
  final String title;
  final String desc;
  const _DiffItem(
      {required this.icon, required this.title, required this.desc});
}

class _DiffCard extends StatelessWidget {
  final _DiffItem item;
  final int index;
  const _DiffCard({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final color =
        [AppColors.primary, AppColors.secondary, AppColors.accent][index % 3];
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.28)),
            ),
            child: Icon(item.icon, color: color),
          ),
          const SizedBox(height: 14),
          Text(item.title,
              style: context.textStyles.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w900)),
          const SizedBox(height: 10),
          Text(item.desc, style: context.textStyles.bodyMedium),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 420.ms, delay: (70 * index).ms)
        .slideY(begin: 0.06, end: 0);
  }
}

class _ProofStrip extends StatelessWidget {
  final bool isDesktop;
  const _ProofStrip({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final items = [
      _ProofItem(
          value: '10x',
          label: context.tr(
              pt: 'mais rapidez na validação', en: 'faster validation')),
      _ProofItem(
          value: '0',
          label: context.tr(pt: 'surpresas no escopo', en: 'scope surprises')),
      _ProofItem(
          value: '99%',
          label: context.tr(
              pt: 'foco em UX + performance', en: 'focus on UX + performance')),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.surfaceHighlight),
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.12),
            AppColors.secondary.withValues(alpha: 0.10),
            AppColors.accent.withValues(alpha: 0.08)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: isDesktop
          ? Row(children: [
              for (int i = 0; i < items.length; i++)
                Expanded(child: _ProofBlock(item: items[i], index: i))
            ])
          : Column(children: [
              for (int i = 0; i < items.length; i++) ...[
                if (i != 0) const SizedBox(height: 14),
                _ProofBlock(item: items[i], index: i)
              ]
            ]),
    ).animate().fadeIn(duration: 450.ms).scaleXY(begin: 0.98, end: 1);
  }
}

class _ProofItem {
  final String value;
  final String label;
  const _ProofItem({required this.value, required this.label});
}

class _ProofBlock extends StatelessWidget {
  final _ProofItem item;
  final int index;
  const _ProofBlock({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    final color =
        [AppColors.primary, AppColors.secondary, AppColors.accent][index % 3];
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: color.withValues(alpha: 0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.value,
              style: context.textStyles.displaySmall
                  ?.copyWith(color: color, fontWeight: FontWeight.w900)),
          const SizedBox(height: 6),
          Text(item.label,
              style: context.textStyles.bodyMedium?.copyWith(
                  color: AppColors.textPrimary.withValues(alpha: 0.9))),
        ],
      ),
    );
  }
}
