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

class CasesPage extends StatelessWidget {
  const CasesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final isTablet = width >= 768 && width < 1024;
    final columns = isDesktop ? 3 : (isTablet ? 2 : 1);
    final cases = CaseStudies.all(context);

    return MarketingPageScaffold(
      activeRoute: AppRoutes.cases,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Hero(),
          const SizedBox(height: 56),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        context.tr(
                            pt: 'Cases que comprovam o padrão',
                            en: 'Case studies that prove our standards'),
                        style: context.textStyles.headlineLarge),
                    const SizedBox(height: 10),
                    Text(
                      context.tr(
                        pt: 'Aqui estão exemplos de entregas e resultados típicos. Se você quiser, mostramos cases reais em uma call (sob NDA quando necessário).',
                        en: 'Here are examples of typical deliverables and outcomes. We can walk you through real projects on a call, under NDA when needed.',
                      ),
                      style: context.textStyles.bodyLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),
              if (isDesktop)
                ElevatedButton(
                  onPressed: () => context.push(AppRoutes.consultation),
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 26, vertical: 18)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.calendar_month_rounded,
                          color: AppColors.background),
                      const SizedBox(width: 10),
                      Text(context.tr(
                          pt: 'Agendar consultoria',
                          en: 'Book a consultation')),
                    ],
                  ),
                ),
            ],
          ).animate().fadeIn(duration: 450.ms),
          const SizedBox(height: 24),
          _CasesGrid(columns: columns, cases: cases),
          const SizedBox(height: 32),
          if (!isDesktop)
            Align(
              alignment: Alignment.centerLeft,
              child: ElevatedButton(
                onPressed: () => context.push(AppRoutes.consultation),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 26, vertical: 18)),
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
            ).animate().fadeIn(duration: 450.ms).slideX(begin: 0.06, end: 0),
        ],
      ),
    );
  }
}

class _Hero extends StatelessWidget {
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
              'assets/images/abstract_app_interface_turquoise_1774235981689.jpg'),
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
                const Icon(Icons.workspaces_rounded,
                    size: 16, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  context.tr(pt: 'CASES', en: 'CASE STUDIES'),
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                      letterSpacing: 1.6),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
              context.tr(
                  pt: 'Resultados que falam por você.',
                  en: 'Results that speak for themselves.'),
              style: isMobile
                  ? context.textStyles.displaySmall
                  : context.textStyles.displayMedium),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              context.tr(
                pt: 'Projetos com visual premium, performance e clareza no roadmap — pensados para escalar e vender.',
                en: 'Projects with premium visuals, high performance and a clear roadmap — built to scale and sell.',
              ),
              style: context.textStyles.bodyLarge,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms).slideY(begin: 0.04, end: 0);
  }
}

class _CasesGrid extends StatelessWidget {
  final int columns;
  final List<CaseStudy> cases;
  const _CasesGrid({required this.columns, required this.cases});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 18.0;
        final itemWidth =
            (constraints.maxWidth - (columns - 1) * spacing) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (int i = 0; i < cases.length; i++)
              SizedBox(
                  width: itemWidth, child: _CaseCard(data: cases[i], index: i)),
          ],
        );
      },
    );
  }
}

class _CaseCard extends StatefulWidget {
  final CaseStudy data;
  final int index;
  const _CaseCard({required this.data, required this.index});

  @override
  State<_CaseCard> createState() => _CaseCardState();
}

class _CaseCardState extends State<_CaseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final accent = data.accent;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          context.push('${AppRoutes.cases}/${data.id}');
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
                color: _hovered
                    ? accent.withValues(alpha: 0.55)
                    : AppColors.surfaceHighlight),
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
                    child: Icon(data.icon, color: accent),
                  ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: accent.withValues(alpha: 0.35)),
                    ),
                    child: Text(
                      data.metric,
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w900,
                          color: accent,
                          letterSpacing: 0.2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Text(data.title,
                  style: context.textStyles.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w900)),
              const SizedBox(height: 10),
              Text(data.subtitle, style: context.textStyles.bodyMedium),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(context.tr(pt: 'Ver detalhes', en: 'View details'),
                      style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w800,
                          color:
                              AppColors.textPrimary.withValues(alpha: 0.85))),
                  const SizedBox(width: 8),
                  Icon(Icons.arrow_forward_rounded,
                      size: 18,
                      color: _hovered ? accent : AppColors.textSecondary),
                ],
              ),
            ],
          ),
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 420.ms, delay: (60 * widget.index).ms)
        .slideY(begin: 0.06, end: 0);
  }
}
