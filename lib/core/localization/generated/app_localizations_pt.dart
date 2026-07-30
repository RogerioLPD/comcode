// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Comcode - Fábrica de Softwares e Aplicativos';

  @override
  String get navHome => 'Home';

  @override
  String get navServices => 'Serviços';

  @override
  String get navDifferentials => 'Diferenciais';

  @override
  String get navCases => 'Cases';

  @override
  String get navScheduleConsultation => 'Agendar Consultoria';

  @override
  String get navScheduleFreeConsultation => 'Agendar consultoria grátis';

  @override
  String get navBackToHome => 'voltar para home';

  @override
  String get navMenu => 'Menu';

  @override
  String get navClose => 'Fechar';

  @override
  String get navLanguage => 'Idioma';

  @override
  String get langPortuguese => 'PT';

  @override
  String get langEnglish => 'EN';

  @override
  String footerRights(Object year) {
    return '© $year Comcode Fábrica de Softwares e Aplicativos. Todos os direitos reservados.';
  }

  @override
  String get consultTag => 'CONSULTORIA GRATUITA';

  @override
  String get consultHeroTitle => 'Vamos destravar seu projeto?';

  @override
  String get consultHeroSubtitle =>
      'Em 20 minutos a gente entende seu cenário e te devolve um plano: stack, escopo inicial, prazos e próximos passos.';

  @override
  String get consultYourData => 'Seus dados';

  @override
  String get consultAboutProject => 'Sobre o projeto';

  @override
  String get consultName => 'Nome';

  @override
  String get consultNameHint => 'Seu nome completo';

  @override
  String get consultEmail => 'E-mail';

  @override
  String get consultEmailHint => 'voce@empresa.com';

  @override
  String get consultWhatsApp => 'WhatsApp';

  @override
  String get consultWhatsAppHint => '(DD) 99999-9999';

  @override
  String get consultCompanyOptional => 'Empresa (opcional)';

  @override
  String get consultCompanyHint => 'Nome da sua empresa';

  @override
  String get consultType => 'Tipo';

  @override
  String get consultBudget => 'Orçamento';

  @override
  String get consultGoal => 'Objetivo';

  @override
  String get consultGoalHint => 'O que você quer atingir com esse projeto?';

  @override
  String get consultSendAndSchedule => 'Enviar e agendar';

  @override
  String get consultNoSpam => 'Sem spam. Você recebe resposta humana.';

  @override
  String get consultSendViaTitle => 'Enviar por…';

  @override
  String get consultSendViaSubtitle =>
      'Escolha o canal para enviar seu pedido. Vamos receber com os dados do formulário já preenchidos.';

  @override
  String get consultChannelEmail => 'E-mail';

  @override
  String get consultChannelEmailSub => 'Envia para comcode@gmail.com';

  @override
  String get consultChannelWhatsApp => 'WhatsApp';

  @override
  String get consultChannelWhatsAppSub =>
      'Abre conversa/grupo (você define o destino depois)';

  @override
  String get consultErrorWhatsAppNotConfigured =>
      'WhatsApp ainda não configurado. Me envie o número/grupo e eu ajusto.';

  @override
  String get consultErrorCannotOpenApp =>
      'Não foi possível abrir o app agora. Tente novamente.';

  @override
  String get consultSuccessTitle => 'Pedido enviado!';

  @override
  String get consultSuccessBody =>
      'Perfeito — abrimos o canal escolhido (E-mail/WhatsApp) com a mensagem pronta. Se você não conseguir enviar agora, pode tentar novamente.';

  @override
  String get consultBackHome => 'Voltar para Home';

  @override
  String get consultNextSteps => 'Próximos passos';

  @override
  String get consultNextStepsSoon =>
      'Em breve: integração real (leads, calendário, e-mail).';

  @override
  String get consultDemoNote =>
      'Obs.: este formulário está em modo demo (sem backend). Quando você conectar Firebase/Supabase, a gente grava os leads automaticamente.';

  @override
  String get consultInfoDurationTitle => 'Duração';

  @override
  String get consultInfoDurationBody =>
      '20 minutos (objetivo: clareza e próximos passos).';

  @override
  String get consultInfoOutcomeTitle => 'Você sai com';

  @override
  String get consultInfoOutcomeBody =>
      'Stack sugerida + escopo inicial + estimativa de prazos.';

  @override
  String get consultInfoConfidentialityTitle => 'Confidencialidade';

  @override
  String get consultInfoConfidentialityBody =>
      'Se o projeto for sensível, podemos seguir com NDA.';

  @override
  String get validationEnterName => 'Informe seu nome';

  @override
  String get validationEnterEmail => 'Informe seu e-mail';

  @override
  String get validationInvalidEmail => 'E-mail inválido';

  @override
  String get validationEnterWhatsApp => 'Informe seu WhatsApp';

  @override
  String get validationTellMore => 'Conte um pouco mais (mín. 10 caracteres)';

  @override
  String get projectTypeApp => 'App';

  @override
  String get projectTypeWebSaas => 'Web/SaaS';

  @override
  String get projectTypeInternal => 'Sistema interno';

  @override
  String get projectTypeIntegrations => 'Integrações';

  @override
  String get budgetUpTo15k => 'Até R\$ 15k';

  @override
  String get budget15k40k => 'R\$ 15k–40k';

  @override
  String get budget40k80k => 'R\$ 40k–80k';

  @override
  String get budget80kPlus => '80k+';

  @override
  String get budgetUnknown => 'Ainda não sei';

  @override
  String get servicesEyebrow => 'SERVIÇOS';

  @override
  String get servicesTitle =>
      'Softwares e apps sob medida — com padrão de produto.';

  @override
  String get servicesSubtitle =>
      'Da ideia ao lançamento (e além): design, engenharia e evolução contínua. Tudo com velocidade, qualidade e foco em resultado.';

  @override
  String get servicesWhatWeDeliverTitle => 'O que entregamos';

  @override
  String get servicesWhatWeDeliverSubtitle =>
      'Pacotes de serviço que encaixam em diferentes momentos do seu negócio.';

  @override
  String get servicesCardAppsTitle => 'Aplicativos (iOS/Android)';

  @override
  String get servicesCardAppsDesc =>
      'Flutter, performance alta, UI premium, integrações, publicação e evolução.';

  @override
  String get servicesCardAppsHighlight => 'MVP em semanas';

  @override
  String get servicesCardWebTitle => 'Plataformas Web / SaaS';

  @override
  String get servicesCardWebDesc =>
      'Painéis administrativos, dashboards, multi-tenant, assinaturas e escalabilidade.';

  @override
  String get servicesCardWebHighlight => 'Pronto para crescer';

  @override
  String get servicesCardIntegrationsTitle => 'Integrações & Automação';

  @override
  String get servicesCardIntegrationsDesc =>
      'APIs, pagamentos, CRMs, ERPs, WhatsApp, automações e dados em tempo real.';

  @override
  String get servicesCardIntegrationsHighlight => 'Processos enxutos';

  @override
  String get servicesCardDesignTitle => 'UI/UX Design';

  @override
  String get servicesCardDesignDesc =>
      'Research leve, protótipo rápido, design system, motion e handoff impecável.';

  @override
  String get servicesCardDesignHighlight => 'Interface que vende';

  @override
  String get servicesProcessTitle => 'Nosso processo';

  @override
  String get servicesProcessSubtitle =>
      'Transparente, iterativo e com checkpoints que dão previsibilidade.';

  @override
  String get servicesTimelineDiagnosisTitle => 'Diagnóstico';

  @override
  String get servicesTimelineDiagnosisDesc =>
      'Entendimento do problema, metas, usuários e riscos.';

  @override
  String get servicesTimelineUxTitle => 'UX + Protótipo';

  @override
  String get servicesTimelineUxDesc =>
      'Wireframe, UI e validação rápida antes de codar.';

  @override
  String get servicesTimelineBuildTitle => 'Build';

  @override
  String get servicesTimelineBuildDesc =>
      'Sprints curtos, entregas frequentes e qualidade.';

  @override
  String get servicesTimelineEvolveTitle => 'Evolução';

  @override
  String get servicesTimelineEvolveDesc =>
      'Métricas, melhorias e novas features para escalar.';

  @override
  String get servicesCtaTitle => 'Quer um orçamento rápido?';

  @override
  String get servicesCtaBody =>
      'Agende uma consultoria gratuita e receba um plano de ação claro (escopo, tecnologia, prazos).';

  @override
  String get servicesCtaButton => 'Agendar';

  @override
  String get diffSectionTitle => 'O que faz a Comcode diferente';

  @override
  String get diffSectionSubtitle =>
      'Mais do que entregar código: entregamos clareza, previsibilidade e um produto que dá orgulho de mostrar.';

  @override
  String get diffHeroTitle => 'Qualidade premium, sem enrolação.';

  @override
  String get diffEyebrow => 'DIFERENCIAIS';

  @override
  String get diffHeroSubtitle =>
      'Processo enxuto + comunicação clara + engenharia de verdade. O seu projeto anda mais rápido e com menos risco.';

  @override
  String get diffBadgeSpeedTitle => 'Velocidade';

  @override
  String get diffBadgeSpeedSubtitle => 'sem perder padrão';

  @override
  String get diffBadgeSecurityTitle => 'Segurança';

  @override
  String get diffBadgeSecuritySubtitle => 'arquitetura sólida';

  @override
  String get diffItemClarityTitle => 'Objetivo claro';

  @override
  String get diffItemClarityDesc =>
      'Definimos métricas e entregas. Menos achismo, mais direção.';

  @override
  String get diffItemArchitectureTitle => 'Arquitetura escalável';

  @override
  String get diffItemArchitectureDesc =>
      'Base sólida para crescer sem virar um monstro difícil de manter.';

  @override
  String get diffItemDesignTitle => 'Design que converte';

  @override
  String get diffItemDesignDesc =>
      'UI/UX pensado para o usuário — e para o seu resultado.';

  @override
  String get diffItemCommunicationTitle => 'Comunicação sem ruído';

  @override
  String get diffItemCommunicationDesc =>
      'Acompanhamento e checkpoints. Você sempre sabe o que está acontecendo.';

  @override
  String get diffItemDeliveryTitle => 'Entrega rápida';

  @override
  String get diffItemDeliveryDesc =>
      'Sprints curtos e releases frequentes com qualidade controlada.';

  @override
  String get diffItemQualityTitle => 'Qualidade real';

  @override
  String get diffItemQualityDesc =>
      'Boas práticas, revisão, testes quando faz sentido e monitoramento.';
}
