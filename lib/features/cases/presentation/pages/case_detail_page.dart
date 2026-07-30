import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/features/cases/data/case_studies.dart';
import 'package:comcode/features/cases/domain/entities/case_study.dart';
import 'package:comcode/shared/widgets/marketing_page_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comcode/core/localization/site_strings.dart';

class CaseDetailPage extends StatelessWidget {
  final String caseId;
  const CaseDetailPage({super.key, required this.caseId});

  @override
  Widget build(BuildContext context) {
    final data = CaseStudies.byId(context, caseId);
    if (data == null) {
      return MarketingPageScaffold(
        activeRoute: AppRoutes.cases,
        child: _NotFound(onBack: () => context.go(AppRoutes.cases)),
      );
    }

    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;

    return MarketingPageScaffold(
      activeRoute: AppRoutes.cases,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CaseHeader(data: data),
          const SizedBox(height: 22),
          _ActionsRow(accent: data.accent, isDesktop: isDesktop),
          const SizedBox(height: 28),
          _HighlightsRow(data: data, isDesktop: isDesktop),
          const SizedBox(height: 18),
          _SectionCard(
            title: context.tr(pt: 'Desafio', en: 'Challenge'),
            icon: Icons.flag_rounded,
            accent: data.accent,
            child: Text(data.challenge, style: context.textStyles.bodyLarge),
          )
              .animate()
              .fadeIn(duration: 420.ms, delay: 80.ms)
              .slideY(begin: 0.06, end: 0),
          const SizedBox(height: 18),
          _DeliveriesCard(data: data)
              .animate()
              .fadeIn(duration: 420.ms, delay: 120.ms)
              .slideY(begin: 0.06, end: 0),
          const SizedBox(height: 18),
          _StackAndResults(data: data, isDesktop: isDesktop)
              .animate()
              .fadeIn(duration: 420.ms, delay: 160.ms)
              .slideY(begin: 0.06, end: 0),
          const SizedBox(height: 18),
          if (data.testimonial != null)
            _TestimonialCard(accent: data.accent, quote: data.testimonial!)
                .animate()
                .fadeIn(duration: 420.ms, delay: 200.ms)
                .slideY(begin: 0.06, end: 0),
          const SizedBox(height: 28),
          _BottomCta(accent: data.accent)
              .animate()
              .fadeIn(duration: 420.ms, delay: 240.ms)
              .slideY(begin: 0.06, end: 0),
        ],
      ),
    );
  }
}

class _NotFound extends StatelessWidget {
  final VoidCallback onBack;
  const _NotFound({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 720),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.surfaceHighlight),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.search_off_rounded,
                  color: AppColors.textPrimary, size: 44),
              const SizedBox(height: 12),
              Text(
                  context.tr(
                      pt: 'Case não encontrado', en: 'Case study not found'),
                  style: context.textStyles.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: 8),
              Text(
                  context.tr(
                      pt: 'Este link pode estar incorreto ou o conteúdo foi movido.',
                      en: 'This link may be incorrect or the content may have moved.'),
                  style: context.textStyles.bodyLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onBack,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 14)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_back_rounded,
                        color: AppColors.background),
                    const SizedBox(width: 10),
                    Text(context.tr(
                        pt: 'Voltar para Cases', en: 'Back to Case Studies')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CaseHeader extends StatelessWidget {
  final CaseStudy data;
  const _CaseHeader({required this.data});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 22 : 34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: AppColors.surfaceHighlight),
        gradient: LinearGradient(
          colors: [
            data.accent.withValues(alpha: 0.18),
            AppColors.surface,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: data.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(18),
                  border:
                      Border.all(color: data.accent.withValues(alpha: 0.28)),
                ),
                child: Icon(data.icon, color: data.accent),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CASE STUDY',
                      style: GoogleFonts.outfit(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: data.accent,
                          letterSpacing: 2.2),
                    ),
                    const SizedBox(height: 10),
                    Text(data.title,
                        style: isMobile
                            ? context.textStyles.headlineLarge
                            : context.textStyles.displaySmall),
                    const SizedBox(height: 10),
                    Text(data.subtitle, style: context.textStyles.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _Pill(
                  label: data.metric,
                  accent: data.accent,
                  icon: Icons.trending_up_rounded),
              _Pill(
                  label: data.industry,
                  accent: AppColors.textSecondary,
                  icon: Icons.apartment_rounded,
                  outlined: true),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 420.ms).slideY(begin: 0.05, end: 0);
  }
}

class _Pill extends StatelessWidget {
  final String label;
  final Color accent;
  final IconData icon;
  final bool outlined;
  const _Pill(
      {required this.label,
      required this.accent,
      required this.icon,
      this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: outlined ? AppColors.background : accent.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
            color: outlined
                ? AppColors.surfaceHighlight
                : accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: 18, color: outlined ? AppColors.textSecondary : accent),
          const SizedBox(width: 8),
          Text(
            label,
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.w900,
                color: outlined ? AppColors.textPrimary : accent,
                letterSpacing: 0.15),
          ),
        ],
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  final Color accent;
  final bool isDesktop;
  const _ActionsRow({required this.accent, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: () => context.go(AppRoutes.cases),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.surfaceHighlight),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          ),
          icon: const Icon(Icons.arrow_back_rounded,
              color: AppColors.textPrimary),
          label: Text(context.tr(pt: 'Voltar', en: 'Back'),
              style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w800, color: AppColors.textPrimary)),
        ),
        ElevatedButton(
          onPressed: () => context.push(AppRoutes.consultation),
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 16)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_month_rounded,
                  color: AppColors.background),
              const SizedBox(width: 10),
              Text(context.tr(
                  pt: 'Agendar consultoria grátis',
                  en: 'Book a free consultation')),
            ],
          ),
        ),
        if (isDesktop)
          Text(
            context.tr(
              pt: '• Detalhe demonstrativo (sem backend) — usamos NDA para cases reais quando necessário.',
              en: '• Demonstration content (no backend) — we use NDAs for real case studies when needed.',
            ),
            style: context.textStyles.bodySmall
                ?.copyWith(color: AppColors.textSecondary),
          ),
      ],
    );
  }
}

class _HighlightsRow extends StatelessWidget {
  final CaseStudy data;
  final bool isDesktop;
  const _HighlightsRow({required this.data, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final children = [
      _MiniCard(
        accent: data.accent,
        icon: Icons.verified_rounded,
        title: context.tr(pt: 'Perfil do cliente', en: 'Client profile'),
        text: data.clientProfile,
      ),
      _MiniCard(
        accent: data.accent,
        icon: Icons.shield_rounded,
        title: context.tr(pt: 'Governança', en: 'Governance'),
        text: context.tr(
            pt: 'Entregas com rastreabilidade, padrões e foco em estabilidade.',
            en: 'Traceable deliverables, consistent standards and a focus on stability.'),
      ),
      _MiniCard(
        accent: data.accent,
        icon: Icons.speed_rounded,
        title: context.tr(pt: 'Execução', en: 'Delivery'),
        text: context.tr(
            pt: 'Sprints curtos, checkpoints e clareza de roadmap.',
            en: 'Short sprints, checkpoints and a clear roadmap.'),
      ),
    ];

    if (!isDesktop) {
      return Column(
        children: [
          for (final c in children) ...[c, const SizedBox(height: 12)],
        ],
      );
    }

    return Row(
      children: [
        Expanded(child: children[0]),
        const SizedBox(width: 14),
        Expanded(child: children[1]),
        const SizedBox(width: 14),
        Expanded(child: children[2]),
      ],
    );
  }
}

class _MiniCard extends StatelessWidget {
  final Color accent;
  final IconData icon;
  final String title;
  final String text;
  const _MiniCard(
      {required this.accent,
      required this.icon,
      required this.title,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
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
              Icon(icon, color: accent),
              const SizedBox(width: 10),
              Expanded(
                  child: Text(title,
                      style: context.textStyles.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w900))),
            ],
          ),
          const SizedBox(height: 10),
          Text(text, style: context.textStyles.bodyMedium),
        ],
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color accent;
  final Widget child;
  const _SectionCard(
      {required this.title,
      required this.icon,
      required this.accent,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: accent.withValues(alpha: 0.28)),
                ),
                child: Icon(icon, color: accent),
              ),
              const SizedBox(width: 12),
              Text(title, style: context.textStyles.headlineSmall),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _DeliveriesCard extends StatelessWidget {
  final CaseStudy data;
  const _DeliveriesCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: context.tr(pt: 'O que entregamos', en: 'What we delivered'),
      icon: Icons.inventory_2_rounded,
      accent: data.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in data.deliveries) ...[
            _Bullet(text: item, accent: data.accent),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  final Color accent;
  const _Bullet({required this.text, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 4),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: accent,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(text, style: context.textStyles.bodyLarge)),
      ],
    );
  }
}

class _StackAndResults extends StatelessWidget {
  final CaseStudy data;
  final bool isDesktop;
  const _StackAndResults({required this.data, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final stackCard = _SectionCard(
      title: context.tr(pt: 'Stack & padrões', en: 'Stack & standards'),
      icon: Icons.layers_rounded,
      accent: data.accent,
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          for (final s in data.stack) _Chip(label: s, accent: data.accent),
        ],
      ),
    );

    final resultsCard = _SectionCard(
      title: context.tr(pt: 'Resultados', en: 'Results'),
      icon: Icons.insights_rounded,
      accent: data.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in data.results) ...[
            _Bullet(text: item, accent: data.accent),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );

    if (!isDesktop) {
      return Column(
        children: [
          stackCard,
          const SizedBox(height: 18),
          resultsCard,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: stackCard),
        const SizedBox(width: 18),
        Expanded(child: resultsCard),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final Color accent;
  const _Chip({required this.label, required this.accent});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: accent.withValues(alpha: 0.24)),
      ),
      child: Text(
        label,
        style: GoogleFonts.outfit(
            fontWeight: FontWeight.w900,
            color: AppColors.textPrimary.withValues(alpha: 0.95)),
      ),
    );
  }
}

class _TestimonialCard extends StatelessWidget {
  final Color accent;
  final String quote;
  const _TestimonialCard({required this.accent, required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.format_quote_rounded, size: 34, color: accent),
          const SizedBox(width: 12),
          Expanded(
              child: Text(quote,
                  style: context.textStyles.titleMedium
                      ?.copyWith(height: 1.5, fontWeight: FontWeight.w700))),
        ],
      ),
    );
  }
}

class _BottomCta extends StatelessWidget {
  final Color accent;
  const _BottomCta({required this.accent});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 22 : 28),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: AppColors.surfaceHighlight),
        gradient: LinearGradient(
          colors: [
            accent.withValues(alpha: 0.24),
            AppColors.surface,
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
                Text(
                    context.tr(
                        pt: 'Quer um resultado similar no seu projeto?',
                        en: 'Want similar results for your project?'),
                    style: context.textStyles.headlineSmall),
                const SizedBox(height: 8),
                Text(
                  context.tr(
                    pt: 'A consultoria é rápida, objetiva e já sai com diagnóstico + próximos passos.',
                    en: 'The consultation is quick and focused, and you leave with a diagnosis and clear next steps.',
                  ),
                  style: context.textStyles.bodyLarge,
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          ElevatedButton(
            onPressed: () => context.push(AppRoutes.consultation),
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 16)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.bolt_rounded, color: AppColors.background),
                const SizedBox(width: 10),
                Text(context.tr(pt: 'Agendar agora', en: 'Book now')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
