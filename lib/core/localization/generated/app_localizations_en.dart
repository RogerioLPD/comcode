// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Comcode - Software & App Factory';

  @override
  String get navHome => 'Home';

  @override
  String get navServices => 'Services';

  @override
  String get navDifferentials => 'Why Comcode';

  @override
  String get navCases => 'Case Studies';

  @override
  String get navScheduleConsultation => 'Book a Consultation';

  @override
  String get navScheduleFreeConsultation => 'Book a free consultation';

  @override
  String get navBackToHome => 'back to home';

  @override
  String get navMenu => 'Menu';

  @override
  String get navClose => 'Close';

  @override
  String get navLanguage => 'Language';

  @override
  String get langPortuguese => 'PT';

  @override
  String get langEnglish => 'EN';

  @override
  String footerRights(Object year) {
    return '© $year Comcode Software & App Factory. All rights reserved.';
  }

  @override
  String get consultTag => 'FREE CONSULTATION';

  @override
  String get consultHeroTitle => 'Ready to unlock your project?';

  @override
  String get consultHeroSubtitle =>
      'In 20 minutes we understand your context and return a plan: stack, initial scope, timeline and next steps.';

  @override
  String get consultYourData => 'Your details';

  @override
  String get consultAboutProject => 'About the project';

  @override
  String get consultName => 'Name';

  @override
  String get consultNameHint => 'Your full name';

  @override
  String get consultEmail => 'Email';

  @override
  String get consultEmailHint => 'you@company.com';

  @override
  String get consultWhatsApp => 'WhatsApp';

  @override
  String get consultWhatsAppHint => '+55 (11) 99999-9999';

  @override
  String get consultCompanyOptional => 'Company (optional)';

  @override
  String get consultCompanyHint => 'Your company name';

  @override
  String get consultType => 'Type';

  @override
  String get consultBudget => 'Budget';

  @override
  String get consultGoal => 'Goal';

  @override
  String get consultGoalHint =>
      'What do you want to achieve with this project?';

  @override
  String get consultSendAndSchedule => 'Send & book';

  @override
  String get consultNoSpam => 'No spam. You’ll get a human reply.';

  @override
  String get consultSendViaTitle => 'Send via…';

  @override
  String get consultSendViaSubtitle =>
      'Choose the channel to send your request. We’ll receive it with the form details pre-filled.';

  @override
  String get consultChannelEmail => 'Email';

  @override
  String get consultChannelEmailSub => 'Sends to comcode@gmail.com';

  @override
  String get consultChannelWhatsApp => 'WhatsApp';

  @override
  String get consultChannelWhatsAppSub =>
      'Opens chat/group (you’ll define the destination)';

  @override
  String get consultErrorWhatsAppNotConfigured =>
      'WhatsApp isn’t configured yet. Send me the number/group and I’ll adjust it.';

  @override
  String get consultErrorCannotOpenApp =>
      'Couldn’t open the app right now. Please try again.';

  @override
  String get consultSuccessTitle => 'Request sent!';

  @override
  String get consultSuccessBody =>
      'Perfect — we opened the chosen channel (Email/WhatsApp) with a ready message. If you can’t send now, try again.';

  @override
  String get consultBackHome => 'Back to Home';

  @override
  String get consultNextSteps => 'Next steps';

  @override
  String get consultNextStepsSoon =>
      'Coming soon: real integration (leads, calendar, email).';

  @override
  String get consultDemoNote =>
      'Note: this form is in demo mode (no backend). When you connect Firebase/Supabase, we’ll store leads automatically.';

  @override
  String get consultInfoDurationTitle => 'Duration';

  @override
  String get consultInfoDurationBody =>
      '20 minutes (goal: clarity and next steps).';

  @override
  String get consultInfoOutcomeTitle => 'You’ll leave with';

  @override
  String get consultInfoOutcomeBody =>
      'Suggested stack + initial scope + timeline estimate.';

  @override
  String get consultInfoConfidentialityTitle => 'Confidentiality';

  @override
  String get consultInfoConfidentialityBody =>
      'If the project is sensitive, we can proceed under an NDA.';

  @override
  String get validationEnterName => 'Please enter your name';

  @override
  String get validationEnterEmail => 'Please enter your email';

  @override
  String get validationInvalidEmail => 'Invalid email';

  @override
  String get validationEnterWhatsApp => 'Please enter your WhatsApp';

  @override
  String get validationTellMore => 'Tell us a bit more (min. 10 characters)';

  @override
  String get projectTypeApp => 'App';

  @override
  String get projectTypeWebSaas => 'Web/SaaS';

  @override
  String get projectTypeInternal => 'Internal system';

  @override
  String get projectTypeIntegrations => 'Integrations';

  @override
  String get budgetUpTo15k => 'Up to R\$ 15k';

  @override
  String get budget15k40k => 'R\$ 15k–40k';

  @override
  String get budget40k80k => 'R\$ 40k–80k';

  @override
  String get budget80kPlus => '80k+';

  @override
  String get budgetUnknown => 'Not sure yet';

  @override
  String get servicesEyebrow => 'SERVICES';

  @override
  String get servicesTitle => 'Custom software & apps — built like a product.';

  @override
  String get servicesSubtitle =>
      'From idea to launch (and beyond): design, engineering and continuous evolution — fast, high-quality, results-first.';

  @override
  String get servicesWhatWeDeliverTitle => 'What we deliver';

  @override
  String get servicesWhatWeDeliverSubtitle =>
      'Service packages that fit different moments of your business.';

  @override
  String get servicesCardAppsTitle => 'Mobile apps (iOS/Android)';

  @override
  String get servicesCardAppsDesc =>
      'Flutter, high performance, premium UI, integrations, publishing and ongoing improvements.';

  @override
  String get servicesCardAppsHighlight => 'MVP in weeks';

  @override
  String get servicesCardWebTitle => 'Web platforms / SaaS';

  @override
  String get servicesCardWebDesc =>
      'Admin panels, dashboards, multi-tenant, subscriptions and scalability.';

  @override
  String get servicesCardWebHighlight => 'Ready to scale';

  @override
  String get servicesCardIntegrationsTitle => 'Integrations & automation';

  @override
  String get servicesCardIntegrationsDesc =>
      'APIs, payments, CRMs, ERPs, WhatsApp, automations and real-time data.';

  @override
  String get servicesCardIntegrationsHighlight => 'Lean processes';

  @override
  String get servicesCardDesignTitle => 'UI/UX design';

  @override
  String get servicesCardDesignDesc =>
      'Light research, fast prototyping, design system, motion and clean handoff.';

  @override
  String get servicesCardDesignHighlight => 'Interfaces that sell';

  @override
  String get servicesProcessTitle => 'Our process';

  @override
  String get servicesProcessSubtitle =>
      'Transparent, iterative and with checkpoints for predictability.';

  @override
  String get servicesTimelineDiagnosisTitle => 'Discovery';

  @override
  String get servicesTimelineDiagnosisDesc =>
      'Understand the problem, goals, users and risks.';

  @override
  String get servicesTimelineUxTitle => 'UX + prototype';

  @override
  String get servicesTimelineUxDesc =>
      'Wireframes, UI and fast validation before building.';

  @override
  String get servicesTimelineBuildTitle => 'Build';

  @override
  String get servicesTimelineBuildDesc =>
      'Short sprints, frequent releases and controlled quality.';

  @override
  String get servicesTimelineEvolveTitle => 'Evolve';

  @override
  String get servicesTimelineEvolveDesc =>
      'Metrics, improvements and new features to scale.';

  @override
  String get servicesCtaTitle => 'Need a quick estimate?';

  @override
  String get servicesCtaBody =>
      'Book a free consultation and get a clear action plan (scope, tech, timeline).';

  @override
  String get servicesCtaButton => 'Book';

  @override
  String get diffSectionTitle => 'What makes Comcode different';

  @override
  String get diffSectionSubtitle =>
      'More than shipping code: we ship clarity, predictability and a product you’re proud to show.';

  @override
  String get diffHeroTitle => 'Premium quality, no fluff.';

  @override
  String get diffEyebrow => 'WHY COMCODE';

  @override
  String get diffHeroSubtitle =>
      'Lean process + clear communication + real engineering. Your project moves faster with less risk.';

  @override
  String get diffBadgeSpeedTitle => 'Speed';

  @override
  String get diffBadgeSpeedSubtitle => 'without losing quality';

  @override
  String get diffBadgeSecurityTitle => 'Security';

  @override
  String get diffBadgeSecuritySubtitle => 'solid architecture';

  @override
  String get diffItemClarityTitle => 'Clear goals';

  @override
  String get diffItemClarityDesc =>
      'We define metrics and deliverables. Less guesswork, more direction.';

  @override
  String get diffItemArchitectureTitle => 'Scalable architecture';

  @override
  String get diffItemArchitectureDesc =>
      'A solid base to grow without becoming hard to maintain.';

  @override
  String get diffItemDesignTitle => 'Design that converts';

  @override
  String get diffItemDesignDesc => 'UI/UX built for users — and for outcomes.';

  @override
  String get diffItemCommunicationTitle => 'Noise-free communication';

  @override
  String get diffItemCommunicationDesc =>
      'Updates and checkpoints. You always know what’s happening.';

  @override
  String get diffItemDeliveryTitle => 'Fast delivery';

  @override
  String get diffItemDeliveryDesc =>
      'Short sprints and frequent releases with controlled quality.';

  @override
  String get diffItemQualityTitle => 'Real quality';

  @override
  String get diffItemQualityDesc =>
      'Best practices, reviews, tests when it makes sense, and monitoring.';
}
