import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/localization/locale_controller.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

/// Top navigation bar used across all marketing pages.
///
/// - Desktop/tablet: inline links + primary CTA
/// - Mobile: compact bar + menu bottom-sheet
class MarketingAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController? scrollController;
  final bool showBackToHome;
  final String? activeRoute;

  const MarketingAppBar(
      {super.key,
      this.scrollController,
      this.showBackToHome = false,
      this.activeRoute});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  State<MarketingAppBar> createState() => _MarketingAppBarState();
}

class _MarketingAppBarState extends State<MarketingAppBar> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController?.addListener(_handleScroll);
    _handleScroll();
  }

  @override
  void didUpdateWidget(covariant MarketingAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController?.removeListener(_handleScroll);
      widget.scrollController?.addListener(_handleScroll);
      _handleScroll();
    }
  }

  void _handleScroll() {
    final c = widget.scrollController;
    final offset = (c != null && c.hasClients) ? c.offset : 0.0;
    final next = offset > 50;
    if (next != _isScrolled && mounted) setState(() => _isScrolled = next);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_handleScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 1024;
    final isMobile = width < 768;
    final l10n = context.l10n;

    return PreferredSize(
      preferredSize: const Size.fromHeight(80),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: _isScrolled
            ? AppColors.surface.withValues(alpha: 0.9)
            : Colors.transparent,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24.0 : 64.0, vertical: 16.0),
            child: Row(
              children: [
                _LogoButton(showBackToHome: widget.showBackToHome),
                const Spacer(),
                if (!isMobile)
                  Row(
                    children: [
                      _NavLink(
                          label: l10n.navServices,
                          route: AppRoutes.services,
                          activeRoute: widget.activeRoute),
                      const SizedBox(width: 32),
                      _NavLink(
                          label: l10n.navDifferentials,
                          route: AppRoutes.differentials,
                          activeRoute: widget.activeRoute),
                      const SizedBox(width: 32),
                      _NavLink(
                          label: l10n.navCases,
                          route: AppRoutes.cases,
                          activeRoute: widget.activeRoute),
                      const SizedBox(width: 24),
                      const _LanguageToggle(),
                      const SizedBox(width: 24),
                      _PrimaryCtaButton(
                        label: l10n.navScheduleConsultation,
                        onPressed: () => context.push(AppRoutes.consultation),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 500.ms)
                      .slideX(begin: 0.12, end: 0),
                if (isMobile)
                  IconButton(
                    tooltip: l10n.navMenu,
                    icon: const Icon(Icons.menu_rounded,
                        color: AppColors.textPrimary, size: 32),
                    onPressed: () => _openMobileMenu(context),
                  ),
                if (isDesktop) const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _openMobileMenu(BuildContext context) async {
    final l10n = context.l10n;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.55),
      builder: (context) {
        return SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.surfaceHighlight),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileMenuItem(
                  icon: Icons.home_rounded,
                  label: l10n.navHome,
                  onTap: () {
                    context.pop();
                    context.go(AppRoutes.home);
                  },
                ),
                _MobileMenuItem(
                  icon: Icons.design_services_rounded,
                  label: l10n.navServices,
                  onTap: () {
                    context.pop();
                    context.push(AppRoutes.services);
                  },
                ),
                _MobileMenuItem(
                  icon: Icons.auto_awesome_rounded,
                  label: l10n.navDifferentials,
                  onTap: () {
                    context.pop();
                    context.push(AppRoutes.differentials);
                  },
                ),
                _MobileMenuItem(
                  icon: Icons.workspaces_rounded,
                  label: l10n.navCases,
                  onTap: () {
                    context.pop();
                    context.push(AppRoutes.cases);
                  },
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(l10n.navLanguage,
                      style: context.textStyles.titleSmall?.copyWith(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w800)),
                ),
                const SizedBox(height: 10),
                const _LanguageToggle(isCompact: false),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pop();
                      context.push(AppRoutes.consultation);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.background,
                      padding: const EdgeInsets.symmetric(vertical: 18),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.calendar_month_rounded,
                            color: AppColors.background),
                        SizedBox(width: 10),
                        Text(l10n.navScheduleFreeConsultation),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 200.ms).slideY(begin: 0.08, end: 0),
        );
      },
    );
  }
}

class _LogoButton extends StatelessWidget {
  final bool showBackToHome;
  const _LogoButton({required this.showBackToHome});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return GestureDetector(
      onTap: () => context.go(AppRoutes.home),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.5),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child:
                const Icon(Icons.code_rounded, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Comcode',
                style: GoogleFonts.outfit(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  letterSpacing: -0.5,
                ),
              ),
              if (showBackToHome)
                Text(
                  l10n.navBackToHome,
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      color: AppColors.textSecondary,
                      height: 1.0),
                ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms).slideX(begin: -0.08, end: 0);
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final String route;
  final String? activeRoute;
  const _NavLink(
      {required this.label, required this.route, required this.activeRoute});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isActive = widget.activeRoute == widget.route;
    final color = isActive
        ? AppColors.primary
        : (_hovered ? AppColors.primary : AppColors.textPrimary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.push(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                  color: (isActive || _hovered)
                      ? AppColors.primary
                      : Colors.transparent,
                  width: 2),
            ),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.outfit(
                fontSize: 16, fontWeight: FontWeight.w600, color: color),
          ),
        ),
      ),
    );
  }
}

class _PrimaryCtaButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const _PrimaryCtaButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.secondary]),
        borderRadius: BorderRadius.circular(100),
        boxShadow: [
          BoxShadow(
              color: AppColors.secondary.withValues(alpha: 0.3),
              blurRadius: 20,
              offset: const Offset(0, 4)),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: GoogleFonts.outfit(
              fontSize: 16, fontWeight: FontWeight.w800, letterSpacing: 0.4),
        ),
        child: Text(label),
      ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _MobileMenuItem(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: AppColors.primary),
        title: Text(label,
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
        trailing: const Icon(Icons.arrow_forward_rounded,
            color: AppColors.textSecondary),
      ),
    );
  }
}

class _LanguageToggle extends StatelessWidget {
  final bool isCompact;
  const _LanguageToggle({this.isCompact = true});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LocaleController>();
    final l10n = context.l10n;
    final effectiveCode =
        (controller.locale ?? Localizations.localeOf(context)).languageCode;
    final selected = effectiveCode == 'en' ? 'en' : 'pt';

    final buttonStyle = ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.surfaceHighlight;
        }
        return Colors.transparent;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.textPrimary;
        return AppColors.textSecondary;
      }),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))),
      visualDensity: isCompact ? VisualDensity.compact : VisualDensity.standard,
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(
          horizontal: isCompact ? 10 : 14, vertical: isCompact ? 10 : 12)),
    );

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: SegmentedButton<String>(
        showSelectedIcon: false,
        style: buttonStyle,
        segments: [
          ButtonSegment(
              value: 'pt',
              label: Text(l10n.langPortuguese,
                  style: GoogleFonts.outfit(fontWeight: FontWeight.w800))),
          ButtonSegment(
              value: 'en',
              label: Text(l10n.langEnglish,
                  style: GoogleFonts.outfit(fontWeight: FontWeight.w800))),
        ],
        selected: {selected},
        onSelectionChanged: (set) {
          final value = set.first;
          if (value == 'en') {
            controller.setEnglish();
          } else {
            controller.setPortuguese();
          }
        },
      ),
    );
  }
}
