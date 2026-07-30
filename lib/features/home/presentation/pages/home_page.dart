import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/shared/widgets/marketing_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/localization/site_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isTablet = MediaQuery.of(context).size.width >= 768 && !isDesktop;
    final isMobile = !isDesktop && !isTablet;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MarketingAppBar(
          scrollController: _scrollController, activeRoute: AppRoutes.home),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero Section
            _buildHeroSection(context, isMobile, isTablet, isDesktop),

            // Services Section
            _buildServicesSection(context, isMobile),

            // Why Us Section
            _buildWhyUsSection(context, isMobile, isDesktop),

            // CTA Section
            _buildCtaSection(context, isMobile),

            // Footer
            _buildFooter(context, isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(
      BuildContext context, bool isMobile, bool isTablet, bool isDesktop) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: isMobile ? 140 : 180,
        bottom: 80,
        left: isMobile ? 24 : 64,
        right: isMobile ? 24 : 64,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        image: DecorationImage(
          image: const AssetImage(
              'assets/images/abstract_3d_technology_purple_1774235980697.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            AppColors.background.withValues(alpha: 0.85),
            BlendMode.darken,
          ),
        ),
      ),
      child: Stack(
        children: [
          // Background Glows
          Positioned(
            top: 100,
            left: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: isMobile ? -50 : 100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.secondary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text Content
              Expanded(
                flex: isDesktop ? 6 : 0,
                child: Column(
                  crossAxisAlignment: isDesktop
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceHighlight,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.3)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.rocket_launch_rounded,
                              color: AppColors.primary, size: 16),
                          const SizedBox(width: 8),
                          Text(
                            context.tr(
                                pt: 'A FÁBRICA DO FUTURO',
                                en: 'THE FACTORY OF THE FUTURE'),
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 800.ms)
                        .slideY(begin: 0.3, end: 0),
                    const SizedBox(height: 32),
                    ShaderMask(
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [Colors.white, Color(0xFFE0E0FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        isMobile
                            ? context.tr(
                                pt: 'Criamos Softwares\nExtraordinários',
                                en: 'We Build Extraordinary\nSoftware')
                            : context.tr(
                                pt: 'Transformamos Ideias em Softwares Extraordinários.',
                                en: 'We Turn Ideas into Extraordinary Software.',
                              ),
                        textAlign:
                            isDesktop ? TextAlign.left : TextAlign.center,
                        style: isMobile
                            ? context.textStyles.displayMedium
                                ?.copyWith(fontSize: 48)
                            : context.textStyles.displayLarge,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 1000.ms, delay: 200.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 24),
                    Text(
                      context.tr(
                        pt: 'Desenvolvemos aplicativos, plataformas web e sistemas sob medida com design impressionante e tecnologia de ponta para escalar o seu negócio.',
                        en: 'We build apps, web platforms and custom systems with outstanding design and cutting-edge technology to scale your business.',
                      ),
                      textAlign: isDesktop ? TextAlign.left : TextAlign.center,
                      style: context.textStyles.bodyLarge?.copyWith(
                        fontSize: isMobile ? 18 : 20,
                        height: 1.6,
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 1000.ms, delay: 400.ms)
                        .slideY(begin: 0.2, end: 0),
                    const SizedBox(height: 48),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      alignment: isDesktop
                          ? WrapAlignment.start
                          : WrapAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [AppColors.primary, AppColors.secondary],
                            ),
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.4),
                                blurRadius: 24,
                                offset: const Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () =>
                                context.push(AppRoutes.consultation),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(
                                horizontal: isMobile ? 32 : 48,
                                vertical: isMobile ? 20 : 24,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(context.tr(
                                    pt: 'Quero inovar',
                                    en: 'I want to innovate')),
                                const SizedBox(width: 12),
                                const Icon(Icons.arrow_forward_rounded),
                              ],
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () => context.push(AppRoutes.cases),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: AppColors.textSecondary, width: 2),
                            foregroundColor: AppColors.textPrimary,
                            padding: EdgeInsets.symmetric(
                              horizontal: isMobile ? 32 : 48,
                              vertical: isMobile ? 20 : 24,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.play_circle_fill_rounded,
                                  color: AppColors.textPrimary),
                              const SizedBox(width: 12),
                              Text(context.tr(
                                  pt: 'Ver portfólio', en: 'View portfolio')),
                            ],
                          ),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(duration: 1000.ms, delay: 600.ms)
                        .slideY(begin: 0.2, end: 0),
                  ],
                ),
              ),

              if (isDesktop) const SizedBox(width: 64),
              if (!isDesktop) const SizedBox(height: 64),

              // Hero Image/Illustration (Floating)
              Expanded(
                flex: isDesktop ? 5 : 0,
                child: SizedBox(
                  height: isMobile ? 300 : 500,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: isMobile ? 280 : 450,
                        height: isMobile ? 280 : 450,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: SweepGradient(
                            colors: [
                              AppColors.primary,
                              AppColors.secondary,
                              AppColors.accent,
                              AppColors.primary,
                            ],
                            stops: const [0.0, 0.33, 0.66, 1.0],
                          ),
                        ),
                      )
                          .animate(onPlay: (controller) => controller.repeat())
                          .rotate(duration: 10.seconds),
                      Container(
                        width: isMobile ? 276 : 446,
                        height: isMobile ? 276 : 446,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          'assets/images/abstract_app_interface_turquoise_1774235981689.jpg',
                          width: isMobile ? 260 : 420,
                          height: isMobile ? 260 : 420,
                          fit: BoxFit.cover,
                        ),
                      )
                          .animate(
                              onPlay: (controller) =>
                                  controller.repeat(reverse: true))
                          .scaleXY(
                              begin: 0.95,
                              end: 1.05,
                              duration: 4.seconds,
                              curve: Curves.easeInOut)
                          .slideY(
                              begin: -0.05,
                              end: 0.05,
                              duration: 3.seconds,
                              curve: Curves.easeInOut),
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(duration: 1200.ms, delay: 400.ms)
                    .scaleXY(begin: 0.8, end: 1.0),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 100,
        horizontal: isMobile ? 24 : 64,
      ),
      color: AppColors.surface,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            context.tr(pt: 'NOSSAS ESPECIALIDADES', en: 'OUR EXPERTISE'),
            style: GoogleFonts.outfit(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.secondary,
              letterSpacing: 2.0,
            ),
          ).animate().fadeIn(duration: 600.ms),
          const SizedBox(height: 16),
          Text(
            context.tr(pt: 'O que construímos?', en: 'What do we build?'),
            style: context.textStyles.headlineLarge,
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms, delay: 100.ms),
          const SizedBox(height: 64),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: [
              _buildServiceCard(
                icon: Icons.smartphone_rounded,
                title: context.tr(
                    pt: 'Apps Nativos & Híbridos', en: 'Native & Hybrid Apps'),
                description: context.tr(
                  pt: 'Criamos aplicativos para iOS e Android com performance imbatível e interfaces impressionantes usando Flutter.',
                  en: 'We build iOS and Android apps with outstanding performance and impressive interfaces using Flutter.',
                ),
                color: AppColors.primary,
                delay: 200,
              ),
              _buildServiceCard(
                icon: Icons.web_rounded,
                title: context.tr(pt: 'Plataformas SaaS', en: 'SaaS Platforms'),
                description: context.tr(
                  pt: 'Desenvolvemos sistemas web modernos, rápidos e escaláveis, prontos para suportar o crescimento da sua empresa.',
                  en: 'We develop modern, fast and scalable web systems, ready to support your company’s growth.',
                ),
                color: AppColors.secondary,
                delay: 400,
              ),
              _buildServiceCard(
                icon: Icons.memory_rounded,
                title:
                    context.tr(pt: 'Sistemas Sob Medida', en: 'Custom Systems'),
                description: context.tr(
                  pt: 'Automatizamos processos complexos com softwares feitos especificamente para as necessidades do seu negócio.',
                  en: 'We automate complex processes with software built specifically for your business needs.',
                ),
                color: AppColors.accent,
                delay: 600,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
    required int delay,
  }) {
    return Container(
      width: 340,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceHighlight, width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.05),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.3)),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: delay.ms)
        .slideY(begin: 0.1, end: 0);
  }

  Widget _buildWhyUsSection(
      BuildContext context, bool isMobile, bool isDesktop) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 120,
        horizontal: isMobile ? 24 : 64,
      ),
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isDesktop ? 1 : 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/modern_tech_startup_blue_1774235982676.jpg',
                    fit: BoxFit.cover,
                    height: isMobile ? 300 : 500,
                    width: double.infinity,
                  ),
                  Container(
                    height: isMobile ? 300 : 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.background,
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
          if (isDesktop) const SizedBox(width: 80),
          if (!isDesktop) const SizedBox(height: 48),
          Expanded(
            flex: isDesktop ? 1 : 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(pt: 'POR QUE A COMCODE?', en: 'WHY COMCODE?'),
                  style: GoogleFonts.outfit(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  context.tr(
                      pt: 'Código perfeito.\nDesign impecável.',
                      en: 'Flawless code.\nImpeccable design.'),
                  style: context.textStyles.displaySmall,
                ),
                const SizedBox(height: 32),
                Text(
                  context.tr(
                    pt: 'Não criamos apenas sistemas, criamos experiências digitais que encantam usuários e resolvem problemas reais de forma elegante e escalável.',
                    en: 'We do more than build systems: we create digital experiences that delight users and solve real problems elegantly and at scale.',
                  ),
                  style: context.textStyles.bodyLarge,
                ),
                const SizedBox(height: 40),
                _buildFeatureBullet(
                    Icons.speed_rounded,
                    context.tr(
                        pt: 'Alta Performance & Escalabilidade',
                        en: 'High Performance & Scalability'),
                    AppColors.primary),
                const SizedBox(height: 24),
                _buildFeatureBullet(
                    Icons.design_services_rounded,
                    context.tr(
                        pt: 'UI/UX Design Moderno e Fluído',
                        en: 'Modern, Fluid UI/UX Design'),
                    AppColors.secondary),
                const SizedBox(height: 24),
                _buildFeatureBullet(
                    Icons.security_rounded,
                    context.tr(
                        pt: 'Arquitetura Segura e Confiável',
                        en: 'Secure, Reliable Architecture'),
                    AppColors.accent),
              ],
            ).animate().fadeIn(duration: 800.ms).slideX(begin: 0.1, end: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureBullet(IconData icon, String text, Color color) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCtaSection(BuildContext context, bool isMobile) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 64,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 32 : 80,
        vertical: isMobile ? 48 : 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.8),
            AppColors.secondary.withValues(alpha: 0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondary.withValues(alpha: 0.3),
            blurRadius: 40,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            context.tr(
                pt: 'Pronto para transformar sua ideia em realidade?',
                en: 'Ready to turn your idea into reality?'),
            textAlign: TextAlign.center,
            style: context.textStyles.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            context.tr(
              pt: 'Fale com nossos especialistas e descubra como podemos acelerar seu negócio.',
              en: 'Talk to our experts and discover how we can accelerate your business.',
            ),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: () => context.push(AppRoutes.consultation),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.background,
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
            ),
            child: Text(
              context.tr(
                  pt: 'Agendar Consultoria Gratuita',
                  en: 'Book a Free Consultation'),
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 800.ms).scaleXY(begin: 0.95, end: 1.0);
  }

  Widget _buildFooter(BuildContext context, bool isMobile) {
    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 48,
      ),
      child: Column(
        children: [
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Icon(Icons.code_rounded,
                      color: AppColors.primary, size: 32),
                  const SizedBox(width: 12),
                  Text(
                    'Comcode',
                    style: GoogleFonts.outfit(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              if (isMobile) const SizedBox(height: 32),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _FooterIcon(
                    FontAwesomeIcons.whatsapp,
                    url:
                        'https://chat.whatsapp.com/DOThO2IjXiZ97bat13fzIc?mode=hqctcli',
                    tooltip: context.tr(
                        pt: 'Entrar no grupo do WhatsApp',
                        en: 'Join our WhatsApp group'),
                  ),
                  const SizedBox(width: 16),
                  _FooterIcon(
                    FontAwesomeIcons.instagram,
                    url:
                        'https://www.instagram.com/comcodefabrica?igsh=bGo5djc0ZmU4Yjcz&utm_source=qr',
                    tooltip: context.tr(
                        pt: 'Seguir no Instagram',
                        en: 'Follow us on Instagram'),
                  ),
                ],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 32),
            child: Divider(color: AppColors.surfaceHighlight),
          ),
          Text(
            context.l10n.footerRights(DateTime.now().year.toString()),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _FooterIcon extends StatefulWidget {
  final FaIconData icon;
  final String url;
  final String tooltip;

  const _FooterIcon(
    this.icon, {
    required this.url,
    required this.tooltip,
  });

  @override
  State<_FooterIcon> createState() => _FooterIconState();
}

class _FooterIconState extends State<_FooterIcon> {
  bool _isHovered = false;

  Future<void> _openLink() async {
    final Uri uri = Uri.parse(widget.url);
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  Color _getHoverColor() {
    if (widget.icon == FontAwesomeIcons.whatsapp) {
      return const Color(0xFF25D366); // verde oficial
    } else if (widget.icon == FontAwesomeIcons.instagram) {
      return const Color(0xFFE1306C); // rosa Instagram
    }
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    final hoverColor = _getHoverColor();

    return Tooltip(
      message: widget.tooltip,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: _openLink,
          child: AnimatedScale(
            scale: _isHovered ? 1.15 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _isHovered
                    ? hoverColor.withValues(alpha: 0.15)
                    : AppColors.background,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: _isHovered ? hoverColor : AppColors.surfaceHighlight,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: hoverColor.withValues(alpha: 0.4),
                          blurRadius: 12,
                          spreadRadius: 1,
                        ),
                      ]
                    : [],
              ),
              child: FaIcon(
                widget.icon,
                color: _isHovered ? hoverColor : AppColors.textSecondary,
                size: 22,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
