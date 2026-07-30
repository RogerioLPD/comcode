import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @appTitle.
  ///
  /// In pt, this message translates to:
  /// **'Comcode - Fábrica de Softwares e Aplicativos'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In pt, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navServices.
  ///
  /// In pt, this message translates to:
  /// **'Serviços'**
  String get navServices;

  /// No description provided for @navDifferentials.
  ///
  /// In pt, this message translates to:
  /// **'Diferenciais'**
  String get navDifferentials;

  /// No description provided for @navCases.
  ///
  /// In pt, this message translates to:
  /// **'Cases'**
  String get navCases;

  /// No description provided for @navScheduleConsultation.
  ///
  /// In pt, this message translates to:
  /// **'Agendar Consultoria'**
  String get navScheduleConsultation;

  /// No description provided for @navScheduleFreeConsultation.
  ///
  /// In pt, this message translates to:
  /// **'Agendar consultoria grátis'**
  String get navScheduleFreeConsultation;

  /// No description provided for @navBackToHome.
  ///
  /// In pt, this message translates to:
  /// **'voltar para home'**
  String get navBackToHome;

  /// No description provided for @navMenu.
  ///
  /// In pt, this message translates to:
  /// **'Menu'**
  String get navMenu;

  /// No description provided for @navClose.
  ///
  /// In pt, this message translates to:
  /// **'Fechar'**
  String get navClose;

  /// No description provided for @navLanguage.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get navLanguage;

  /// No description provided for @langPortuguese.
  ///
  /// In pt, this message translates to:
  /// **'PT'**
  String get langPortuguese;

  /// No description provided for @langEnglish.
  ///
  /// In pt, this message translates to:
  /// **'EN'**
  String get langEnglish;

  /// No description provided for @footerRights.
  ///
  /// In pt, this message translates to:
  /// **'© {year} Comcode Fábrica de Softwares e Aplicativos. Todos os direitos reservados.'**
  String footerRights(Object year);

  /// No description provided for @consultTag.
  ///
  /// In pt, this message translates to:
  /// **'CONSULTORIA GRATUITA'**
  String get consultTag;

  /// No description provided for @consultHeroTitle.
  ///
  /// In pt, this message translates to:
  /// **'Vamos destravar seu projeto?'**
  String get consultHeroTitle;

  /// No description provided for @consultHeroSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Em 20 minutos a gente entende seu cenário e te devolve um plano: stack, escopo inicial, prazos e próximos passos.'**
  String get consultHeroSubtitle;

  /// No description provided for @consultYourData.
  ///
  /// In pt, this message translates to:
  /// **'Seus dados'**
  String get consultYourData;

  /// No description provided for @consultAboutProject.
  ///
  /// In pt, this message translates to:
  /// **'Sobre o projeto'**
  String get consultAboutProject;

  /// No description provided for @consultName.
  ///
  /// In pt, this message translates to:
  /// **'Nome'**
  String get consultName;

  /// No description provided for @consultNameHint.
  ///
  /// In pt, this message translates to:
  /// **'Seu nome completo'**
  String get consultNameHint;

  /// No description provided for @consultEmail.
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get consultEmail;

  /// No description provided for @consultEmailHint.
  ///
  /// In pt, this message translates to:
  /// **'voce@empresa.com'**
  String get consultEmailHint;

  /// No description provided for @consultWhatsApp.
  ///
  /// In pt, this message translates to:
  /// **'WhatsApp'**
  String get consultWhatsApp;

  /// No description provided for @consultWhatsAppHint.
  ///
  /// In pt, this message translates to:
  /// **'(DD) 99999-9999'**
  String get consultWhatsAppHint;

  /// No description provided for @consultCompanyOptional.
  ///
  /// In pt, this message translates to:
  /// **'Empresa (opcional)'**
  String get consultCompanyOptional;

  /// No description provided for @consultCompanyHint.
  ///
  /// In pt, this message translates to:
  /// **'Nome da sua empresa'**
  String get consultCompanyHint;

  /// No description provided for @consultType.
  ///
  /// In pt, this message translates to:
  /// **'Tipo'**
  String get consultType;

  /// No description provided for @consultBudget.
  ///
  /// In pt, this message translates to:
  /// **'Orçamento'**
  String get consultBudget;

  /// No description provided for @consultGoal.
  ///
  /// In pt, this message translates to:
  /// **'Objetivo'**
  String get consultGoal;

  /// No description provided for @consultGoalHint.
  ///
  /// In pt, this message translates to:
  /// **'O que você quer atingir com esse projeto?'**
  String get consultGoalHint;

  /// No description provided for @consultSendAndSchedule.
  ///
  /// In pt, this message translates to:
  /// **'Enviar e agendar'**
  String get consultSendAndSchedule;

  /// No description provided for @consultNoSpam.
  ///
  /// In pt, this message translates to:
  /// **'Sem spam. Você recebe resposta humana.'**
  String get consultNoSpam;

  /// No description provided for @consultSendViaTitle.
  ///
  /// In pt, this message translates to:
  /// **'Enviar por…'**
  String get consultSendViaTitle;

  /// No description provided for @consultSendViaSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Escolha o canal para enviar seu pedido. Vamos receber com os dados do formulário já preenchidos.'**
  String get consultSendViaSubtitle;

  /// No description provided for @consultChannelEmail.
  ///
  /// In pt, this message translates to:
  /// **'E-mail'**
  String get consultChannelEmail;

  /// No description provided for @consultChannelEmailSub.
  ///
  /// In pt, this message translates to:
  /// **'Envia para comcode@gmail.com'**
  String get consultChannelEmailSub;

  /// No description provided for @consultChannelWhatsApp.
  ///
  /// In pt, this message translates to:
  /// **'WhatsApp'**
  String get consultChannelWhatsApp;

  /// No description provided for @consultChannelWhatsAppSub.
  ///
  /// In pt, this message translates to:
  /// **'Abre conversa/grupo (você define o destino depois)'**
  String get consultChannelWhatsAppSub;

  /// No description provided for @consultErrorWhatsAppNotConfigured.
  ///
  /// In pt, this message translates to:
  /// **'WhatsApp ainda não configurado. Me envie o número/grupo e eu ajusto.'**
  String get consultErrorWhatsAppNotConfigured;

  /// No description provided for @consultErrorCannotOpenApp.
  ///
  /// In pt, this message translates to:
  /// **'Não foi possível abrir o app agora. Tente novamente.'**
  String get consultErrorCannotOpenApp;

  /// No description provided for @consultSuccessTitle.
  ///
  /// In pt, this message translates to:
  /// **'Pedido enviado!'**
  String get consultSuccessTitle;

  /// No description provided for @consultSuccessBody.
  ///
  /// In pt, this message translates to:
  /// **'Perfeito — abrimos o canal escolhido (E-mail/WhatsApp) com a mensagem pronta. Se você não conseguir enviar agora, pode tentar novamente.'**
  String get consultSuccessBody;

  /// No description provided for @consultBackHome.
  ///
  /// In pt, this message translates to:
  /// **'Voltar para Home'**
  String get consultBackHome;

  /// No description provided for @consultNextSteps.
  ///
  /// In pt, this message translates to:
  /// **'Próximos passos'**
  String get consultNextSteps;

  /// No description provided for @consultNextStepsSoon.
  ///
  /// In pt, this message translates to:
  /// **'Em breve: integração real (leads, calendário, e-mail).'**
  String get consultNextStepsSoon;

  /// No description provided for @consultDemoNote.
  ///
  /// In pt, this message translates to:
  /// **'Obs.: este formulário está em modo demo (sem backend). Quando você conectar Firebase/Supabase, a gente grava os leads automaticamente.'**
  String get consultDemoNote;

  /// No description provided for @consultInfoDurationTitle.
  ///
  /// In pt, this message translates to:
  /// **'Duração'**
  String get consultInfoDurationTitle;

  /// No description provided for @consultInfoDurationBody.
  ///
  /// In pt, this message translates to:
  /// **'20 minutos (objetivo: clareza e próximos passos).'**
  String get consultInfoDurationBody;

  /// No description provided for @consultInfoOutcomeTitle.
  ///
  /// In pt, this message translates to:
  /// **'Você sai com'**
  String get consultInfoOutcomeTitle;

  /// No description provided for @consultInfoOutcomeBody.
  ///
  /// In pt, this message translates to:
  /// **'Stack sugerida + escopo inicial + estimativa de prazos.'**
  String get consultInfoOutcomeBody;

  /// No description provided for @consultInfoConfidentialityTitle.
  ///
  /// In pt, this message translates to:
  /// **'Confidencialidade'**
  String get consultInfoConfidentialityTitle;

  /// No description provided for @consultInfoConfidentialityBody.
  ///
  /// In pt, this message translates to:
  /// **'Se o projeto for sensível, podemos seguir com NDA.'**
  String get consultInfoConfidentialityBody;

  /// No description provided for @validationEnterName.
  ///
  /// In pt, this message translates to:
  /// **'Informe seu nome'**
  String get validationEnterName;

  /// No description provided for @validationEnterEmail.
  ///
  /// In pt, this message translates to:
  /// **'Informe seu e-mail'**
  String get validationEnterEmail;

  /// No description provided for @validationInvalidEmail.
  ///
  /// In pt, this message translates to:
  /// **'E-mail inválido'**
  String get validationInvalidEmail;

  /// No description provided for @validationEnterWhatsApp.
  ///
  /// In pt, this message translates to:
  /// **'Informe seu WhatsApp'**
  String get validationEnterWhatsApp;

  /// No description provided for @validationTellMore.
  ///
  /// In pt, this message translates to:
  /// **'Conte um pouco mais (mín. 10 caracteres)'**
  String get validationTellMore;

  /// No description provided for @projectTypeApp.
  ///
  /// In pt, this message translates to:
  /// **'App'**
  String get projectTypeApp;

  /// No description provided for @projectTypeWebSaas.
  ///
  /// In pt, this message translates to:
  /// **'Web/SaaS'**
  String get projectTypeWebSaas;

  /// No description provided for @projectTypeInternal.
  ///
  /// In pt, this message translates to:
  /// **'Sistema interno'**
  String get projectTypeInternal;

  /// No description provided for @projectTypeIntegrations.
  ///
  /// In pt, this message translates to:
  /// **'Integrações'**
  String get projectTypeIntegrations;

  /// No description provided for @budgetUpTo15k.
  ///
  /// In pt, this message translates to:
  /// **'Até R\$ 15k'**
  String get budgetUpTo15k;

  /// No description provided for @budget15k40k.
  ///
  /// In pt, this message translates to:
  /// **'R\$ 15k–40k'**
  String get budget15k40k;

  /// No description provided for @budget40k80k.
  ///
  /// In pt, this message translates to:
  /// **'R\$ 40k–80k'**
  String get budget40k80k;

  /// No description provided for @budget80kPlus.
  ///
  /// In pt, this message translates to:
  /// **'80k+'**
  String get budget80kPlus;

  /// No description provided for @budgetUnknown.
  ///
  /// In pt, this message translates to:
  /// **'Ainda não sei'**
  String get budgetUnknown;

  /// No description provided for @servicesEyebrow.
  ///
  /// In pt, this message translates to:
  /// **'SERVIÇOS'**
  String get servicesEyebrow;

  /// No description provided for @servicesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Softwares e apps sob medida — com padrão de produto.'**
  String get servicesTitle;

  /// No description provided for @servicesSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Da ideia ao lançamento (e além): design, engenharia e evolução contínua. Tudo com velocidade, qualidade e foco em resultado.'**
  String get servicesSubtitle;

  /// No description provided for @servicesWhatWeDeliverTitle.
  ///
  /// In pt, this message translates to:
  /// **'O que entregamos'**
  String get servicesWhatWeDeliverTitle;

  /// No description provided for @servicesWhatWeDeliverSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Pacotes de serviço que encaixam em diferentes momentos do seu negócio.'**
  String get servicesWhatWeDeliverSubtitle;

  /// No description provided for @servicesCardAppsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Aplicativos (iOS/Android)'**
  String get servicesCardAppsTitle;

  /// No description provided for @servicesCardAppsDesc.
  ///
  /// In pt, this message translates to:
  /// **'Flutter, performance alta, UI premium, integrações, publicação e evolução.'**
  String get servicesCardAppsDesc;

  /// No description provided for @servicesCardAppsHighlight.
  ///
  /// In pt, this message translates to:
  /// **'MVP em semanas'**
  String get servicesCardAppsHighlight;

  /// No description provided for @servicesCardWebTitle.
  ///
  /// In pt, this message translates to:
  /// **'Plataformas Web / SaaS'**
  String get servicesCardWebTitle;

  /// No description provided for @servicesCardWebDesc.
  ///
  /// In pt, this message translates to:
  /// **'Painéis administrativos, dashboards, multi-tenant, assinaturas e escalabilidade.'**
  String get servicesCardWebDesc;

  /// No description provided for @servicesCardWebHighlight.
  ///
  /// In pt, this message translates to:
  /// **'Pronto para crescer'**
  String get servicesCardWebHighlight;

  /// No description provided for @servicesCardIntegrationsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Integrações & Automação'**
  String get servicesCardIntegrationsTitle;

  /// No description provided for @servicesCardIntegrationsDesc.
  ///
  /// In pt, this message translates to:
  /// **'APIs, pagamentos, CRMs, ERPs, WhatsApp, automações e dados em tempo real.'**
  String get servicesCardIntegrationsDesc;

  /// No description provided for @servicesCardIntegrationsHighlight.
  ///
  /// In pt, this message translates to:
  /// **'Processos enxutos'**
  String get servicesCardIntegrationsHighlight;

  /// No description provided for @servicesCardDesignTitle.
  ///
  /// In pt, this message translates to:
  /// **'UI/UX Design'**
  String get servicesCardDesignTitle;

  /// No description provided for @servicesCardDesignDesc.
  ///
  /// In pt, this message translates to:
  /// **'Research leve, protótipo rápido, design system, motion e handoff impecável.'**
  String get servicesCardDesignDesc;

  /// No description provided for @servicesCardDesignHighlight.
  ///
  /// In pt, this message translates to:
  /// **'Interface que vende'**
  String get servicesCardDesignHighlight;

  /// No description provided for @servicesProcessTitle.
  ///
  /// In pt, this message translates to:
  /// **'Nosso processo'**
  String get servicesProcessTitle;

  /// No description provided for @servicesProcessSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Transparente, iterativo e com checkpoints que dão previsibilidade.'**
  String get servicesProcessSubtitle;

  /// No description provided for @servicesTimelineDiagnosisTitle.
  ///
  /// In pt, this message translates to:
  /// **'Diagnóstico'**
  String get servicesTimelineDiagnosisTitle;

  /// No description provided for @servicesTimelineDiagnosisDesc.
  ///
  /// In pt, this message translates to:
  /// **'Entendimento do problema, metas, usuários e riscos.'**
  String get servicesTimelineDiagnosisDesc;

  /// No description provided for @servicesTimelineUxTitle.
  ///
  /// In pt, this message translates to:
  /// **'UX + Protótipo'**
  String get servicesTimelineUxTitle;

  /// No description provided for @servicesTimelineUxDesc.
  ///
  /// In pt, this message translates to:
  /// **'Wireframe, UI e validação rápida antes de codar.'**
  String get servicesTimelineUxDesc;

  /// No description provided for @servicesTimelineBuildTitle.
  ///
  /// In pt, this message translates to:
  /// **'Build'**
  String get servicesTimelineBuildTitle;

  /// No description provided for @servicesTimelineBuildDesc.
  ///
  /// In pt, this message translates to:
  /// **'Sprints curtos, entregas frequentes e qualidade.'**
  String get servicesTimelineBuildDesc;

  /// No description provided for @servicesTimelineEvolveTitle.
  ///
  /// In pt, this message translates to:
  /// **'Evolução'**
  String get servicesTimelineEvolveTitle;

  /// No description provided for @servicesTimelineEvolveDesc.
  ///
  /// In pt, this message translates to:
  /// **'Métricas, melhorias e novas features para escalar.'**
  String get servicesTimelineEvolveDesc;

  /// No description provided for @servicesCtaTitle.
  ///
  /// In pt, this message translates to:
  /// **'Quer um orçamento rápido?'**
  String get servicesCtaTitle;

  /// No description provided for @servicesCtaBody.
  ///
  /// In pt, this message translates to:
  /// **'Agende uma consultoria gratuita e receba um plano de ação claro (escopo, tecnologia, prazos).'**
  String get servicesCtaBody;

  /// No description provided for @servicesCtaButton.
  ///
  /// In pt, this message translates to:
  /// **'Agendar'**
  String get servicesCtaButton;

  /// No description provided for @diffSectionTitle.
  ///
  /// In pt, this message translates to:
  /// **'O que faz a Comcode diferente'**
  String get diffSectionTitle;

  /// No description provided for @diffSectionSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Mais do que entregar código: entregamos clareza, previsibilidade e um produto que dá orgulho de mostrar.'**
  String get diffSectionSubtitle;

  /// No description provided for @diffHeroTitle.
  ///
  /// In pt, this message translates to:
  /// **'Qualidade premium, sem enrolação.'**
  String get diffHeroTitle;

  /// No description provided for @diffEyebrow.
  ///
  /// In pt, this message translates to:
  /// **'DIFERENCIAIS'**
  String get diffEyebrow;

  /// No description provided for @diffHeroSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Processo enxuto + comunicação clara + engenharia de verdade. O seu projeto anda mais rápido e com menos risco.'**
  String get diffHeroSubtitle;

  /// No description provided for @diffBadgeSpeedTitle.
  ///
  /// In pt, this message translates to:
  /// **'Velocidade'**
  String get diffBadgeSpeedTitle;

  /// No description provided for @diffBadgeSpeedSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'sem perder padrão'**
  String get diffBadgeSpeedSubtitle;

  /// No description provided for @diffBadgeSecurityTitle.
  ///
  /// In pt, this message translates to:
  /// **'Segurança'**
  String get diffBadgeSecurityTitle;

  /// No description provided for @diffBadgeSecuritySubtitle.
  ///
  /// In pt, this message translates to:
  /// **'arquitetura sólida'**
  String get diffBadgeSecuritySubtitle;

  /// No description provided for @diffItemClarityTitle.
  ///
  /// In pt, this message translates to:
  /// **'Objetivo claro'**
  String get diffItemClarityTitle;

  /// No description provided for @diffItemClarityDesc.
  ///
  /// In pt, this message translates to:
  /// **'Definimos métricas e entregas. Menos achismo, mais direção.'**
  String get diffItemClarityDesc;

  /// No description provided for @diffItemArchitectureTitle.
  ///
  /// In pt, this message translates to:
  /// **'Arquitetura escalável'**
  String get diffItemArchitectureTitle;

  /// No description provided for @diffItemArchitectureDesc.
  ///
  /// In pt, this message translates to:
  /// **'Base sólida para crescer sem virar um monstro difícil de manter.'**
  String get diffItemArchitectureDesc;

  /// No description provided for @diffItemDesignTitle.
  ///
  /// In pt, this message translates to:
  /// **'Design que converte'**
  String get diffItemDesignTitle;

  /// No description provided for @diffItemDesignDesc.
  ///
  /// In pt, this message translates to:
  /// **'UI/UX pensado para o usuário — e para o seu resultado.'**
  String get diffItemDesignDesc;

  /// No description provided for @diffItemCommunicationTitle.
  ///
  /// In pt, this message translates to:
  /// **'Comunicação sem ruído'**
  String get diffItemCommunicationTitle;

  /// No description provided for @diffItemCommunicationDesc.
  ///
  /// In pt, this message translates to:
  /// **'Acompanhamento e checkpoints. Você sempre sabe o que está acontecendo.'**
  String get diffItemCommunicationDesc;

  /// No description provided for @diffItemDeliveryTitle.
  ///
  /// In pt, this message translates to:
  /// **'Entrega rápida'**
  String get diffItemDeliveryTitle;

  /// No description provided for @diffItemDeliveryDesc.
  ///
  /// In pt, this message translates to:
  /// **'Sprints curtos e releases frequentes com qualidade controlada.'**
  String get diffItemDeliveryDesc;

  /// No description provided for @diffItemQualityTitle.
  ///
  /// In pt, this message translates to:
  /// **'Qualidade real'**
  String get diffItemQualityTitle;

  /// No description provided for @diffItemQualityDesc.
  ///
  /// In pt, this message translates to:
  /// **'Boas práticas, revisão, testes quando faz sentido e monitoramento.'**
  String get diffItemQualityDesc;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
