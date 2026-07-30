import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/shared/widgets/marketing_page_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:comcode/core/localization/generated/app_localizations.dart';
import 'package:comcode/core/localization/site_strings.dart';

class ConsultationPage extends StatefulWidget {
  const ConsultationPage({super.key});

  @override
  State<ConsultationPage> createState() => _ConsultationPageState();
}

class _ConsultationPageState extends State<ConsultationPage> {
  static const String _leadEmailTo = 'rogerio.pinheirodangui@gmail.com';

  /// Destino do WhatsApp.
  ///
  /// Formatos aceitos:
  /// - número internacional com DDI, só dígitos: "5511999999999"
  /// - ou link completo (ex.: https://chat.whatsapp.com/....)
  static const String _whatsAppTarget =
      'https://chat.whatsapp.com/DOThO2IjXiZ97bat13fzIc?mode=hqctcli';

  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _whatsApp = TextEditingController();
  final _company = TextEditingController();
  final _goal = TextEditingController();

  String _projectType = 'app';
  String _budget = 'unknown';
  bool _isSubmitting = false;
  bool _submitted = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _whatsApp.dispose();
    _company.dispose();
    _goal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1024;
    final isMobile = MediaQuery.of(context).size.width < 768;

    return MarketingPageScaffold(
      activeRoute: AppRoutes.consultation,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: _submitted
            ? _SuccessState(onBackHome: () => context.go(AppRoutes.home))
            : Column(
                key: const ValueKey('form'),
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Hero(),
                  const SizedBox(height: 56),
                  Flex(
                    direction: isDesktop ? Axis.horizontal : Axis.vertical,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: _FormCard(
                          formKey: _formKey,
                          isSubmitting: _isSubmitting,
                          name: _name,
                          email: _email,
                          whatsApp: _whatsApp,
                          company: _company,
                          goal: _goal,
                          projectType: _projectType,
                          onProjectTypeChanged: (v) =>
                              setState(() => _projectType = v),
                          budget: _budget,
                          onBudgetChanged: (v) => setState(() => _budget = v),
                          onSubmit: _isSubmitting ? null : _submit,
                        ),
                      ),
                      if (isDesktop) const SizedBox(width: 24),
                      if (!isDesktop) const SizedBox(height: 24),
                      Expanded(flex: 5, child: _SideInfo(isMobile: isMobile)),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final valid = _formKey.currentState?.validate() ?? false;
    if (!valid) return;

    final l10n = context.l10n;
    final payload = {
      'name': _name.text.trim(),
      'email': _email.text.trim(),
      'whatsApp': '55${_whatsApp.text.trim()}',
      'company': _company.text.trim(),
      'projectType': _projectTypeLabel(l10n),
      'budget': _budgetLabel(l10n),
      'goal': _goal.text.trim(),
    };

    debugPrint('[Consultation] Lead form validated: $payload');

    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _SendOptionsSheet(
        onEmail: _isSubmitting ? null : () => _sendViaEmail(payload),
        onWhatsApp: _isSubmitting ? null : () => _sendViaWhatsApp(payload),
      ),
    );
  }

  String _buildLeadMessage(Map<String, String> payload) {
    final l10n = context.l10n;
    final company = (payload['company'] ?? '').trim();
    final companyLabel = context.tr(pt: 'Empresa', en: 'Company');
    final companyLine = company.isEmpty ? '' : '$companyLabel: $company\n';

    return [
      context.tr(
        pt: 'Olá, Comcode! Gostaria de agendar uma consultoria gratuita.',
        en: 'Hello, Comcode! I would like to book a free consultation.',
      ),
      '',
      '${l10n.consultName}: ${payload['name']}',
      '${l10n.consultEmail}: ${payload['email']}',
      '${l10n.consultWhatsApp}: ${payload['whatsApp']}',
      companyLine.isEmpty ? null : companyLine.trimRight(),
      '${l10n.consultType}: ${payload['projectType']}',
      '${l10n.consultBudget}: ${payload['budget']}',
      '',
      '${l10n.consultGoal}:',
      payload['goal'] ?? '',
      '',
      context.tr(
        pt: 'Pode me retornar com os próximos horários disponíveis?',
        en: 'Could you send me the next available times?',
      ),
    ].whereType<String>().join('\n');
  }

  Future<void> _sendViaEmail(Map<String, String> payload) async {
    context.pop();
    final subject =
        context.tr(pt: 'Consultoria gratuita', en: 'Free consultation');
    final fullSubject = '$subject — ${payload['name'] ?? ''}'.trim();
    final body = _buildLeadMessage(payload);
    final uri = Uri(
      scheme: 'mailto',
      path: _leadEmailTo,
      queryParameters: {'subject': fullSubject, 'body': body},
    );

    await _launchAndFinish(uri, channelLabel: 'email');
  }

  Future<void> _sendViaWhatsApp(Map<String, String> payload) async {
    context.pop();

    if (_whatsAppTarget.trim().isEmpty) {
      debugPrint('[Consultation] WhatsApp target not set yet.');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(context.l10n.consultErrorWhatsAppNotConfigured),
            backgroundColor: AppColors.surface),
      );
      return;
    }

    final message = _buildLeadMessage(payload);
    final target = _whatsAppTarget.trim();

    final Uri uri;
    if (target.startsWith('http://') || target.startsWith('https://')) {
      // Caso seja um link de grupo (invite link).
      uri = Uri.parse(target);
    } else {
      // Caso seja número (wa.me). Ex.: 5511999999999
      uri = Uri.parse(
          'https://wa.me/$target?text=${Uri.encodeComponent(message)}');
    }

    await _launchAndFinish(uri, channelLabel: 'whatsapp');
  }

  Future<void> _launchAndFinish(Uri uri, {required String channelLabel}) async {
    setState(() => _isSubmitting = true);
    try {
      final ok = await canLaunchUrl(uri);
      if (!ok) throw Exception('canLaunchUrl=false for $uri');

      final launched = await launchUrl(uri,
          mode: kIsWeb
              ? LaunchMode.platformDefault
              : LaunchMode.externalApplication);
      if (!launched) throw Exception('launchUrl returned false for $uri');

      debugPrint('[Consultation] Lead sent via $channelLabel: $uri');
      if (!mounted) return;
      setState(() => _submitted = true);
    } catch (e) {
      debugPrint('Failed to send lead via $channelLabel: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(context.l10n.consultErrorCannotOpenApp),
            backgroundColor: AppColors.surface),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  String _projectTypeLabel(AppLocalizations l10n) {
    switch (_projectType) {
      case 'web':
        return l10n.projectTypeWebSaas;
      case 'internal':
        return l10n.projectTypeInternal;
      case 'integrations':
        return l10n.projectTypeIntegrations;
      case 'app':
      default:
        return l10n.projectTypeApp;
    }
  }

  String _budgetLabel(AppLocalizations l10n) {
    switch (_budget) {
      case 'upTo15k':
        return l10n.budgetUpTo15k;
      case '15k40k':
        return l10n.budget15k40k;
      case '40k80k':
        return l10n.budget40k80k;
      case '80kPlus':
        return l10n.budget80kPlus;
      case 'unknown':
      default:
        return l10n.budgetUnknown;
    }
  }
}

class _SendOptionsSheet extends StatelessWidget {
  final VoidCallback? onEmail;
  final VoidCallback? onWhatsApp;
  const _SendOptionsSheet({required this.onEmail, required this.onWhatsApp});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16 + bottom),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.surfaceHighlight),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: 0.14),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.28)),
                      ),
                      child: const Icon(Icons.send_rounded,
                          color: AppColors.primary),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Text(l10n.consultSendViaTitle,
                            style: context.textStyles.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w900))),
                    IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(Icons.close_rounded,
                          color: AppColors.textSecondary),
                      tooltip: l10n.navClose,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.consultSendViaSubtitle,
                  style: context.textStyles.bodySmall,
                ),
                const SizedBox(height: 16),
                _ChannelButton(
                  title: l10n.consultChannelEmail,
                  subtitle: l10n.consultChannelEmailSub,
                  icon: Icons.email_rounded,
                  accent: AppColors.secondary,
                  onTap: onEmail,
                ),
                const SizedBox(height: 12),
                _ChannelButton(
                  title: l10n.consultChannelWhatsApp,
                  subtitle: l10n.consultChannelWhatsAppSub,
                  icon: Icons.chat_rounded,
                  accent: AppColors.accent,
                  onTap: onWhatsApp,
                ),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 180.ms).slideY(begin: 0.08, end: 0),
      ),
    );
  }
}

class _ChannelButton extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color accent;
  final VoidCallback? onTap;

  const _ChannelButton(
      {required this.title,
      required this.subtitle,
      required this.icon,
      required this.accent,
      required this.onTap});

  @override
  State<_ChannelButton> createState() => _ChannelButtonState();
}

class _ChannelButtonState extends State<_ChannelButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onTap != null;
    final bg =
        _hovered && enabled ? AppColors.surfaceHighlight : AppColors.background;
    final border = enabled
        ? widget.accent.withValues(alpha: 0.35)
        : AppColors.surfaceHighlight;
    final titleColor =
        enabled ? AppColors.textPrimary : AppColors.textSecondary;

    return MouseRegion(
      cursor: enabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: border),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: widget.accent.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(16),
                  border:
                      Border.all(color: widget.accent.withValues(alpha: 0.26)),
                ),
                child: Icon(widget.icon, color: widget.accent),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: context.textStyles.titleMedium?.copyWith(
                            color: titleColor, fontWeight: FontWeight.w900)),
                    const SizedBox(height: 4),
                    Text(widget.subtitle, style: context.textStyles.bodySmall),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Icon(Icons.arrow_forward_rounded,
                  color: enabled ? widget.accent : AppColors.textSecondary),
            ],
          ),
        ),
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
        image: DecorationImage(
          image: const AssetImage(
              'assets/images/abstract_3d_technology_purple_1774235980697.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              AppColors.background.withValues(alpha: 0.84), BlendMode.darken),
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
                  Border.all(color: AppColors.accent.withValues(alpha: 0.25)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.calendar_month_rounded,
                    size: 16, color: AppColors.accent),
                const SizedBox(width: 8),
                Text(
                  l10n.consultTag,
                  style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: AppColors.accent,
                      letterSpacing: 1.4),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(l10n.consultHeroTitle,
              style: isMobile
                  ? context.textStyles.displaySmall
                  : context.textStyles.displayMedium),
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              l10n.consultHeroSubtitle,
              style: context.textStyles.bodyLarge,
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms).slideY(begin: 0.04, end: 0);
  }
}

class _FormCard extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final bool isSubmitting;
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController whatsApp;
  final TextEditingController company;
  final TextEditingController goal;
  final String projectType;
  final ValueChanged<String> onProjectTypeChanged;
  final String budget;
  final ValueChanged<String> onBudgetChanged;
  final VoidCallback? onSubmit;

  const _FormCard({
    required this.formKey,
    required this.isSubmitting,
    required this.name,
    required this.email,
    required this.whatsApp,
    required this.company,
    required this.goal,
    required this.projectType,
    required this.onProjectTypeChanged,
    required this.budget,
    required this.onBudgetChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      padding: EdgeInsets.all(isMobile ? 22 : 28),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.consultYourData,
                style: context.textStyles.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 16),
            _TextField(
              controller: name,
              label: l10n.consultName,
              hint: l10n.consultNameHint,
              icon: Icons.person_rounded,
              validator: (v) => (v == null || v.trim().length < 3)
                  ? l10n.validationEnterName
                  : null,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 14),
            _TextField(
              controller: email,
              label: l10n.consultEmail,
              hint: l10n.consultEmailHint,
              icon: Icons.email_rounded,
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                final value = v?.trim() ?? '';
                if (value.isEmpty) return l10n.validationEnterEmail;
                if (!value.contains('@') || !value.contains('.')) {
                  return l10n.validationInvalidEmail;
                }
                return null;
              },
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 14),
            _TextField(
              controller: whatsApp,
              label: l10n.consultWhatsApp,
              hint: '11999999999', // só número agora
              icon: Icons.chat_rounded,
              keyboardType: TextInputType.phone,
              validator: (v) {
                final value = v?.trim() ?? '';
                if (value.isEmpty) return l10n.validationEnterWhatsApp;
                if (value.length < 10) return l10n.validationEnterWhatsApp;
                return null;
              },
              textInputAction: TextInputAction.next,
              prefixText: '+55 ',
            ),
            const SizedBox(height: 14),
            _TextField(
              controller: company,
              label: l10n.consultCompanyOptional,
              hint: l10n.consultCompanyHint,
              icon: Icons.apartment_rounded,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 22),
            Text(l10n.consultAboutProject,
                style: context.textStyles.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w900)),
            const SizedBox(height: 16),
            _ChoiceRow(
              label: l10n.consultType,
              value: projectType,
              options: [
                _ChoiceOpt(value: 'app', label: l10n.projectTypeApp),
                _ChoiceOpt(value: 'web', label: l10n.projectTypeWebSaas),
                _ChoiceOpt(value: 'internal', label: l10n.projectTypeInternal),
                _ChoiceOpt(
                    value: 'integrations', label: l10n.projectTypeIntegrations),
              ],
              onChanged: onProjectTypeChanged,
            ),
            const SizedBox(height: 14),
            _ChoiceRow(
              label: l10n.consultBudget,
              value: budget,
              options: [
                _ChoiceOpt(value: 'upTo15k', label: l10n.budgetUpTo15k),
                _ChoiceOpt(value: '15k40k', label: l10n.budget15k40k),
                _ChoiceOpt(value: '40k80k', label: l10n.budget40k80k),
                _ChoiceOpt(value: '80kPlus', label: l10n.budget80kPlus),
                _ChoiceOpt(value: 'unknown', label: l10n.budgetUnknown),
              ],
              onChanged: onBudgetChanged,
            ),
            const SizedBox(height: 14),
            _TextField(
              controller: goal,
              label: l10n.consultGoal,
              hint: l10n.consultGoalHint,
              icon: Icons.track_changes_rounded,
              maxLines: 4,
              validator: (v) => (v == null || v.trim().length < 10)
                  ? l10n.validationTellMore
                  : null,
              textInputAction: TextInputAction.newline,
            ),
            const SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSubmit,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18)),
                child: isSubmitting
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                            strokeWidth: 2, color: AppColors.background),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.send_rounded, color: AppColors.background),
                          SizedBox(width: 10),
                          Text(l10n.consultSendAndSchedule),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.consultNoSpam,
              style: context.textStyles.bodySmall
                  ?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 450.ms).slideY(begin: 0.06, end: 0);
  }
}

class _TextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final String? prefixText;
  final int maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;

  const _TextField({
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.prefixText,
    this.maxLines = 1,
    this.keyboardType,
    this.validator,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: textInputAction,
      style: GoogleFonts.inter(color: AppColors.textPrimary),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixText: prefixText,
        labelStyle: GoogleFonts.outfit(color: AppColors.textSecondary),
        hintStyle: GoogleFonts.inter(
            color: AppColors.textSecondary.withValues(alpha: 0.7)),
        prefixIcon: Icon(icon, color: AppColors.primary),
        filled: true,
        fillColor: AppColors.background,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: AppColors.surfaceHighlight)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: AppColors.surfaceHighlight)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: AppColors.primary, width: 2)),
      ),
    );
  }
}

class _ChoiceRow extends StatelessWidget {
  final String label;
  final String value;
  final List<_ChoiceOpt> options;
  final ValueChanged<String> onChanged;
  const _ChoiceRow(
      {required this.label,
      required this.value,
      required this.options,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: context.textStyles.titleSmall?.copyWith(
                color: AppColors.textPrimary, fontWeight: FontWeight.w800)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final opt in options)
              _ChoiceChip(
                label: opt.label,
                isSelected: opt.value == value,
                onTap: () => onChanged(opt.value),
                isMobile: isMobile,
              ),
          ],
        ),
      ],
    );
  }
}

class _ChoiceOpt {
  final String value;
  final String label;
  const _ChoiceOpt({required this.value, required this.label});
}

class _ChoiceChip extends StatefulWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isMobile;
  const _ChoiceChip(
      {required this.label,
      required this.isSelected,
      required this.onTap,
      required this.isMobile});

  @override
  State<_ChoiceChip> createState() => _ChoiceChipState();
}

class _ChoiceChipState extends State<_ChoiceChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final selected = widget.isSelected;
    final bg = selected
        ? AppColors.primary.withValues(alpha: 0.18)
        : (_hovered ? AppColors.surfaceHighlight : AppColors.background);
    final border = selected ? AppColors.primary : AppColors.surfaceHighlight;
    final textColor = selected ? AppColors.primary : AppColors.textPrimary;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          padding: EdgeInsets.symmetric(
              horizontal: widget.isMobile ? 14 : 16, vertical: 12),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: border),
          ),
          child: Text(
            widget.label,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.outfit(
                fontWeight: FontWeight.w800, color: textColor),
          ),
        ),
      ),
    );
  }
}

class _SideInfo extends StatelessWidget {
  final bool isMobile;
  const _SideInfo({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        _InfoCard(
          icon: Icons.timer_rounded,
          title: l10n.consultInfoDurationTitle,
          text: l10n.consultInfoDurationBody,
          color: AppColors.primary,
        ),
        const SizedBox(height: 14),
        _InfoCard(
          icon: Icons.check_circle_rounded,
          title: l10n.consultInfoOutcomeTitle,
          text: l10n.consultInfoOutcomeBody,
          color: AppColors.secondary,
        ),
        const SizedBox(height: 14),
        _InfoCard(
          icon: Icons.lock_rounded,
          title: l10n.consultInfoConfidentialityTitle,
          text: l10n.consultInfoConfidentialityBody,
          color: AppColors.accent,
        ),
        if (!isMobile) ...[
          const SizedBox(height: 18),
          _MiniNote(),
        ],
      ],
    )
        .animate()
        .fadeIn(duration: 450.ms, delay: 120.ms)
        .slideY(begin: 0.04, end: 0);
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String text;
  final Color color;
  const _InfoCard(
      {required this.icon,
      required this.title,
      required this.text,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: color.withValues(alpha: 0.28)),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: context.textStyles.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w900)),
                const SizedBox(height: 8),
                Text(text, style: context.textStyles.bodyMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniNote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.surfaceHighlight),
      ),
      child: Text(
        context.l10n.consultDemoNote,
        style: context.textStyles.bodySmall,
      ),
    );
  }
}

class _SuccessState extends StatelessWidget {
  final VoidCallback onBackHome;
  const _SuccessState({required this.onBackHome});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isMobile = MediaQuery.of(context).size.width < 768;
    return Container(
      key: const ValueKey('success'),
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 26 : 44),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: AppColors.surfaceHighlight),
        gradient: LinearGradient(
          colors: [
            AppColors.primary.withValues(alpha: 0.14),
            AppColors.secondary.withValues(alpha: 0.10),
            AppColors.background
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.35)),
                ),
                child:
                    const Icon(Icons.check_rounded, color: AppColors.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                  child: Text(l10n.consultSuccessTitle,
                      style: context.textStyles.headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w900))),
            ],
          ).animate().fadeIn(duration: 350.ms),
          const SizedBox(height: 14),
          Text(
            l10n.consultSuccessBody,
            style: context.textStyles.bodyLarge,
          ).animate().fadeIn(duration: 350.ms, delay: 80.ms),
          const SizedBox(height: 24),
          Wrap(
            spacing: 14,
            runSpacing: 14,
            children: [
              ElevatedButton(
                onPressed: onBackHome,
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 18)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home_rounded, color: AppColors.background),
                    SizedBox(width: 10),
                    Text(l10n.consultBackHome),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(l10n.consultNextStepsSoon),
                      backgroundColor: AppColors.surface),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: AppColors.textSecondary, width: 2),
                  foregroundColor: AppColors.textPrimary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                ),
                child: Text(l10n.consultNextSteps),
              ),
            ],
          ).animate().fadeIn(duration: 350.ms, delay: 120.ms),
        ],
      ),
    ).animate().fadeIn(duration: 250.ms).scaleXY(begin: 0.985, end: 1.0);
  }
}
