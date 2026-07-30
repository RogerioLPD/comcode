import 'package:comcode/core/theme/app_theme.dart';
import 'package:comcode/features/cases/domain/entities/case_study.dart';
import 'package:flutter/material.dart';

/// Professional case studies (demo content).
///
/// No backend connected: this keeps content local while enabling deep links
/// and believable, detailed pages for each card.
class CaseStudies {
  static List<CaseStudy> all(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'en' ? _allEn : _allPt;

  static const List<CaseStudy> _allPt = [
    CaseStudy(
      id: 'case-generico-projeto-sob-nda',
      title: 'Projeto sob NDA • Case genérico (template)',
      subtitle:
          'Estrutura de entrega para quando o cliente não pode expor marca — mas quer credibilidade e método.',
      metric: 'TTV -28%',
      icon: Icons.verified_user_rounded,
      accent: AppColors.secondary,
      industry: 'Confidencial / Multi-setor',
      clientProfile:
          'Empresa em fase de crescimento, com restrições de divulgação (NDA). O objetivo era acelerar time-to-value sem abrir mão de segurança e governança.',
      challenge:
          'Entregar um produto com UX premium e performance, mantendo trilha de auditoria, consistência de dados e observabilidade — sem aumentar custo operacional.',
      deliveries: [
        'Discovery rápido (workshop + mapa de jornadas) para priorizar o “core” e reduzir escopo morto',
        'Design system leve (tokens + componentes) para consistência e velocidade de evolução',
        'Arquitetura modular com camadas previsíveis (UI → domínio → dados) e testes em fluxos críticos',
        'Telemetria/observabilidade: logs, eventos, funis e métricas de performance para iteração guiada por dados',
        'Plano de rollout por etapas (feature flags, migração e fallback) minimizando risco em produção',
      ],
      stack: [
        'Flutter',
        'Design System',
        'Observabilidade',
        'Feature Flags',
        'CI/CD'
      ],
      results: [
        'Time-to-value reduzido em 28% com fluxo enxuto e UI consistente',
        'Menos regressões com padrões de arquitetura + cobertura nos fluxos principais',
        'Produto pronto para escalar com métricas claras de ativação, retenção e qualidade',
      ],
      testimonial:
          '“Mesmo sem expor o nome do projeto, dá para ver o método: clareza, qualidade e entrega com governança.”',
    ),
    CaseStudy(
      id: 'grupo-casa-decor-pontuacao',
      title: 'Grupo Casa Decor • Sistema de pontuação',
      subtitle:
          'Programa de relacionamento para arquitetos: pontos, regras, níveis e resgates.',
      metric: '+48% engajamento',
      icon: Icons.stars_rounded,
      accent: AppColors.primary,
      industry: 'Arquitetura & relacionamento',
      clientProfile:
          'Ecossistema com arquitetos, parceiros e campanhas recorrentes — precisando de governança nas regras e métricas de adesão.',
      challenge:
          'Criar um programa de pontuação confiável (com rastreabilidade) para incentivar recorrência, premiar performance e reduzir esforço manual na operação.',
      deliveries: [
        'Arquitetura de “pontos como ledger”: entradas/saídas imutáveis, auditoria e conciliação',
        'Motor de regras para campanhas (validade, multiplicadores, tetos e exceções)',
        'Portal do arquiteto: extrato, status de pontos, histórico de ações e resgates',
        'Backoffice: gestão de campanhas, usuários, permissões, aprovações e relatórios',
        'Camadas anti-fraude: limites por ação, validações e trilha de evidências',
      ],
      stack: [
        'Flutter',
        'RBAC',
        'Ledger de pontos',
        'Regras de campanha',
        'Analytics'
      ],
      results: [
        'Mais clareza e confiança: extrato detalhado e trilha de auditoria para cada movimentação',
        'Operação mais leve com campanhas configuráveis (sem alterar código a cada ação)',
        'Maior engajamento com níveis, metas e resgates guiados por UX',
      ],
      testimonial:
          '“Finalmente temos um sistema transparente: o arquiteto entende seus pontos e a operação ganha controle.”',
    ),
    CaseStudy(
      id: 'fintech-carteira-digital',
      title: 'Fintech • App de carteira digital',
      subtitle: 'Onboarding, KYC, Pix, notificações e painel admin.',
      metric: '+38% conversão',
      icon: Icons.account_balance_wallet_rounded,
      accent: AppColors.primary,
      industry: 'Serviços financeiros',
      clientProfile:
          'Startup em tração, foco em aquisição e redução de fricção no onboarding.',
      challenge:
          'Elevar a conversão do fluxo de entrada sem comprometer compliance e segurança.',
      deliveries: [
        'Arquitetura do fluxo de onboarding com passos curtos e validações progressivas',
        'KYC com automações, checklist e trilhas de exceção para revisão humana',
        'Integração Pix (padrões de mensageria e auditoria) e notificações transacionais',
        'Painel administrativo: permissões, logs, trilhas de auditoria e gestão de limites',
      ],
      stack: [
        'Flutter',
        'GoRouter',
        'CI/CD',
        'Observabilidade',
        'Design System'
      ],
      results: [
        'Conversão de cadastro aumentou em 38% após melhorias de UX e performance',
        'Redução de falhas em etapas críticas com validação incremental e telemetria',
        'Base preparada para escalar com trilhas de auditoria e governança',
      ],
      testimonial:
          '“O app ficou premium e o onboarding finalmente passou a vender sem travar o usuário.”',
    ),
    CaseStudy(
      id: 'saas-gestao-de-equipes',
      title: 'SaaS • Gestão de equipes',
      subtitle: 'Times, permissões, relatórios, auditoria e multi-tenant.',
      metric: '-62% retrabalho',
      icon: Icons.groups_rounded,
      accent: AppColors.secondary,
      industry: 'B2B SaaS',
      clientProfile:
          'Produto com base crescente e necessidade de governança por cliente (multi-tenant).',
      challenge:
          'Diminuir retrabalho operacional e padronizar processos com trilhas e permissões.',
      deliveries: [
        'Modelagem multi-tenant com regras claras de acesso e segregação de dados',
        'Permissões (RBAC) e papéis por time com auditoria de ações críticas',
        'Relatórios com filtros avançados e exportações operacionais',
        'Ajustes de performance e UX para fluxos repetitivos do dia a dia',
      ],
      stack: ['Flutter', 'RBAC', 'Multi-tenant', 'Analytics', 'Design System'],
      results: [
        'Redução de 62% em retrabalho com automações e padronização de fluxos',
        'Menos tickets de suporte com regras de permissão mais previsíveis',
        'Base preparada para novas features sem quebrar clientes existentes',
      ],
      testimonial:
          '“A operação ficou mais leve e a equipe ganhou clareza sobre responsabilidades.”',
    ),
    CaseStudy(
      id: 'industria-automacao-operacional',
      title: 'Indústria • Automação operacional',
      subtitle: 'Checklists, sensores, dashboards e alertas em tempo real.',
      metric: '+4h/dia ganho',
      icon: Icons.precision_manufacturing_rounded,
      accent: AppColors.accent,
      industry: 'Indústria e operações',
      clientProfile:
          'Operação distribuída com rotinas manuais e pouca visibilidade em tempo real.',
      challenge:
          'Reduzir tempo de inspeção e acelerar resposta a desvios operacionais.',
      deliveries: [
        'Checklists digitais por turno com evidências e rastreabilidade',
        'Dashboards de indicadores e alertas com priorização por criticidade',
        'Rotina de exceções: abertura de incidentes, responsáveis e SLAs',
        'Padronização de relatórios para gestão (sem planilhas) e trilhas de decisão',
      ],
      stack: [
        'Flutter',
        'Dashboards',
        'Alertas',
        'Observabilidade',
        'UX de operação'
      ],
      results: [
        'Ganho de ~4 horas/dia somando rotinas automatizadas e menos retrabalho',
        'Resposta mais rápida a falhas com alertas e priorização',
        'Dados auditáveis para melhoria contínua',
      ],
      testimonial:
          '“O time parou de depender de planilha. Agora temos controle e rastreio.”',
    ),
    CaseStudy(
      id: 'educacao-plataforma-de-cursos',
      title: 'Educação • Plataforma de cursos',
      subtitle: 'Aulas, progressos, pagamentos e comunidade.',
      metric: '+22% retenção',
      icon: Icons.school_rounded,
      accent: AppColors.secondary,
      industry: 'Educação digital',
      clientProfile:
          'Negócio já validado, precisando elevar retenção e previsibilidade de receita.',
      challenge:
          'Melhorar experiência de consumo e engajamento sem aumentar suporte.',
      deliveries: [
        'Reestruturação do catálogo com trilhas e recomendações por progresso',
        'Área do aluno com metas, continuidade e histórico de aulas',
        'Fluxos de pagamento e reativação com comunicação clara e confiável',
        'Comunidade com moderação e sinalização de conteúdo relevante',
      ],
      stack: ['Flutter', 'UX', 'Pagamentos', 'Analytics', 'Design System'],
      results: [
        'Retenção aumentou em 22% com progressos mais claros e experiência consistente',
        'Menos dúvidas recorrentes com melhoria de UI e microcópia',
        'Maior aderência a trilhas e conteúdos sugeridos',
      ],
    ),
    CaseStudy(
      id: 'varejo-app-de-fidelidade',
      title: 'Varejo • App de fidelidade',
      subtitle: 'Cupons, QR Code, push, segmentação e campanha.',
      metric: '+31% recorrência',
      icon: Icons.local_offer_rounded,
      accent: AppColors.primary,
      industry: 'Varejo',
      clientProfile:
          'Rede com campanhas frequentes e necessidade de segmentação por comportamento.',
      challenge:
          'Aumentar recorrência e ativação de campanhas com mensuração de impacto.',
      deliveries: [
        'Carteira de cupons com regras, validade e status de uso',
        'Check-in via QR Code com fluxo rápido e tolerância a falhas',
        'Segmentação por histórico e campanhas com métricas por coorte',
        'Notificações com governança: templates, horários e limites',
      ],
      stack: ['Flutter', 'Campanhas', 'Segmentação', 'Mensuração', 'UX'],
      results: [
        'Recorrência aumentou em 31% com experiências de resgate mais fluídas',
        'Campanhas com mensuração clara e melhoria iterativa',
        'Menos fricção no ponto de venda com fluxos simplificados',
      ],
    ),
    CaseStudy(
      id: 'saude-agendamentos-prontuario',
      title: 'Saúde • Agendamentos e prontuário',
      subtitle: 'Agenda, lembretes, consentimento e painéis.',
      metric: '-40% no-show',
      icon: Icons.medical_services_rounded,
      accent: AppColors.accent,
      industry: 'Saúde',
      clientProfile:
          'Clínica com agenda cheia e alto índice de faltas em horários críticos.',
      challenge:
          'Reduzir no-show com comunicação e experiência de agendamento sem atrito.',
      deliveries: [
        'Agendamento com confirmação e lembretes (sem sobrecarregar o usuário)',
        'Consentimento e registros com trilha de auditoria',
        'Painéis para recepção e equipe com visão por dia e por profissional',
        'Padronização de comunicação: templates, horários e regras de reenvio',
      ],
      stack: ['Flutter', 'Fluxos', 'Segurança', 'Auditoria', 'UX'],
      results: [
        'No-show reduzido em 40% com lembretes e confirmação em camadas',
        'Menos trabalho manual da recepção em remarcações',
        'Visibilidade operacional melhorada com painéis e filtros',
      ],
    ),
  ];

  static const List<CaseStudy> _allEn = [
    CaseStudy(
      id: 'case-generico-projeto-sob-nda',
      title: 'Project under NDA • Generic case study',
      subtitle:
          'A delivery framework for clients who cannot disclose their brand but still want to demonstrate credibility and method.',
      metric: 'TTV -28%',
      icon: Icons.verified_user_rounded,
      accent: AppColors.secondary,
      industry: 'Confidential / Multi-industry',
      clientProfile:
          'A growing company with disclosure restrictions. The goal was to accelerate time-to-value without compromising security or governance.',
      challenge:
          'Deliver a high-performance product with premium UX while maintaining audit trails, data consistency and observability without increasing operating costs.',
      deliveries: [
        'Fast discovery workshop and journey mapping to prioritize the core and eliminate unnecessary scope',
        'Lightweight design system with tokens and components for consistency and faster evolution',
        'Modular architecture with predictable layers and tests for critical flows',
        'Telemetry and observability with logs, events, funnels and performance metrics',
        'Staged rollout plan with feature flags, migration and fallback to reduce production risk',
      ],
      stack: [
        'Flutter',
        'Design System',
        'Observability',
        'Feature Flags',
        'CI/CD'
      ],
      results: [
        'Time-to-value reduced by 28% through lean flows and consistent UI',
        'Fewer regressions thanks to architecture standards and coverage of key flows',
        'A product ready to scale with clear activation, retention and quality metrics',
      ],
      testimonial:
          '“Even without naming the project, the method is clear: clarity, quality and delivery with governance.”',
    ),
    CaseStudy(
      id: 'grupo-casa-decor-pontuacao',
      title: 'Grupo Casa Decor • Rewards system',
      subtitle:
          'A relationship program for architects with points, rules, tiers and rewards.',
      metric: '+48% engagement',
      icon: Icons.stars_rounded,
      accent: AppColors.primary,
      industry: 'Architecture & relationships',
      clientProfile:
          'An ecosystem of architects, partners and recurring campaigns that needed rule governance and adoption metrics.',
      challenge:
          'Create a reliable, traceable rewards program to encourage repeat activity, reward performance and reduce manual work.',
      deliveries: [
        'Points-as-a-ledger architecture with immutable entries, auditing and reconciliation',
        'Campaign rules engine covering validity, multipliers, caps and exceptions',
        'Architect portal with balance, point status, activity history and rewards',
        'Back office for campaigns, users, permissions, approvals and reports',
        'Anti-fraud layers with action limits, validations and evidence trails',
      ],
      stack: [
        'Flutter',
        'RBAC',
        'Points ledger',
        'Campaign rules',
        'Analytics'
      ],
      results: [
        'Greater clarity and trust through detailed statements and an audit trail for every transaction',
        'Leaner operations with configurable campaigns that do not require code changes',
        'Higher engagement through UX-guided tiers, goals and rewards',
      ],
      testimonial:
          '“We finally have a transparent system: architects understand their points and operations stay in control.”',
    ),
    CaseStudy(
      id: 'fintech-carteira-digital',
      title: 'Fintech • Digital wallet app',
      subtitle:
          'Onboarding, KYC, Pix payments, notifications and an admin panel.',
      metric: '+38% conversion',
      icon: Icons.account_balance_wallet_rounded,
      accent: AppColors.primary,
      industry: 'Financial services',
      clientProfile:
          'A startup gaining traction, focused on acquisition and reducing onboarding friction.',
      challenge:
          'Increase onboarding conversion without compromising compliance or security.',
      deliveries: [
        'Onboarding architecture with short steps and progressive validation',
        'KYC automation, checklists and exception paths for human review',
        'Pix integration with messaging and audit standards plus transactional notifications',
        'Admin panel with permissions, logs, audit trails and limit management',
      ],
      stack: ['Flutter', 'GoRouter', 'CI/CD', 'Observability', 'Design System'],
      results: [
        'Sign-up conversion increased by 38% after UX and performance improvements',
        'Fewer failures in critical steps through incremental validation and telemetry',
        'A scalable foundation with audit trails and governance',
      ],
      testimonial:
          '“The app feels premium, and onboarding finally converts without getting in the user’s way.”',
    ),
    CaseStudy(
      id: 'saas-gestao-de-equipes',
      title: 'SaaS • Team management',
      subtitle: 'Teams, permissions, reports, auditing and multi-tenancy.',
      metric: '-62% rework',
      icon: Icons.groups_rounded,
      accent: AppColors.secondary,
      industry: 'B2B SaaS',
      clientProfile:
          'A product with a growing customer base that needed tenant-level governance.',
      challenge:
          'Reduce operational rework and standardize processes with clear workflows and permissions.',
      deliveries: [
        'Multi-tenant modeling with clear access rules and data segregation',
        'RBAC permissions and team roles with auditing of critical actions',
        'Reports with advanced filters and operational exports',
        'Performance and UX improvements for repetitive daily workflows',
      ],
      stack: ['Flutter', 'RBAC', 'Multi-tenant', 'Analytics', 'Design System'],
      results: [
        'Rework reduced by 62% through automation and standardized flows',
        'Fewer support tickets thanks to more predictable permission rules',
        'A foundation ready for new features without disrupting existing customers',
      ],
      testimonial:
          '“Operations became lighter, and the team gained clarity about responsibilities.”',
    ),
    CaseStudy(
      id: 'industria-automacao-operacional',
      title: 'Industry • Operations automation',
      subtitle: 'Checklists, sensors, dashboards and real-time alerts.',
      metric: '+4h/day saved',
      icon: Icons.precision_manufacturing_rounded,
      accent: AppColors.accent,
      industry: 'Industry & operations',
      clientProfile:
          'A distributed operation with manual routines and limited real-time visibility.',
      challenge:
          'Reduce inspection time and accelerate the response to operational deviations.',
      deliveries: [
        'Digital shift checklists with evidence and traceability',
        'KPI dashboards and alerts prioritized by severity',
        'Exception workflows covering incidents, owners and SLAs',
        'Standardized management reports and decision trails without spreadsheets',
      ],
      stack: [
        'Flutter',
        'Dashboards',
        'Alerts',
        'Observability',
        'Operations UX'
      ],
      results: [
        'About four hours saved per day through automated routines and less rework',
        'Faster response to failures through alerts and prioritization',
        'Auditable data for continuous improvement',
      ],
      testimonial:
          '“The team stopped relying on spreadsheets. Now we have control and traceability.”',
    ),
    CaseStudy(
      id: 'educacao-plataforma-de-cursos',
      title: 'Education • Course platform',
      subtitle: 'Lessons, progress, payments and community.',
      metric: '+22% retention',
      icon: Icons.school_rounded,
      accent: AppColors.secondary,
      industry: 'Digital education',
      clientProfile:
          'A validated business that needed stronger retention and more predictable revenue.',
      challenge:
          'Improve the learning and engagement experience without increasing support demand.',
      deliveries: [
        'Restructured catalog with learning paths and progress-based recommendations',
        'Student area with goals, continuity and lesson history',
        'Payment and reactivation flows with clear, trustworthy communication',
        'Community features with moderation and relevant-content signals',
      ],
      stack: ['Flutter', 'UX', 'Payments', 'Analytics', 'Design System'],
      results: [
        'Retention increased by 22% through clearer progress and a consistent experience',
        'Fewer recurring questions after UI and microcopy improvements',
        'Higher adoption of recommended learning paths and content',
      ],
    ),
    CaseStudy(
      id: 'varejo-app-de-fidelidade',
      title: 'Retail • Loyalty app',
      subtitle:
          'Coupons, QR codes, push notifications, segmentation and campaigns.',
      metric: '+31% repeat visits',
      icon: Icons.local_offer_rounded,
      accent: AppColors.primary,
      industry: 'Retail',
      clientProfile:
          'A retail network with frequent campaigns that needed behavior-based segmentation.',
      challenge:
          'Increase repeat visits and campaign activation with measurable impact.',
      deliveries: [
        'Coupon wallet with rules, expiration dates and redemption status',
        'Fast, fault-tolerant QR code check-in',
        'History-based segmentation and campaigns with cohort metrics',
        'Governed notifications with templates, schedules and limits',
      ],
      stack: ['Flutter', 'Campaigns', 'Segmentation', 'Measurement', 'UX'],
      results: [
        'Repeat visits increased by 31% through smoother redemption experiences',
        'Clearly measured campaigns supporting continuous improvement',
        'Less friction at the point of sale through simplified flows',
      ],
    ),
    CaseStudy(
      id: 'saude-agendamentos-prontuario',
      title: 'Healthcare • Scheduling and records',
      subtitle: 'Scheduling, reminders, consent and dashboards.',
      metric: '-40% no-shows',
      icon: Icons.medical_services_rounded,
      accent: AppColors.accent,
      industry: 'Healthcare',
      clientProfile:
          'A busy clinic with high no-show rates during critical time slots.',
      challenge:
          'Reduce no-shows through clear communication and a frictionless booking experience.',
      deliveries: [
        'Scheduling with confirmations and reminders that do not overwhelm users',
        'Consent and record management with an audit trail',
        'Daily and practitioner views for reception and clinical teams',
        'Standardized communication with templates, schedules and resend rules',
      ],
      stack: ['Flutter', 'Flows', 'Security', 'Auditing', 'UX'],
      results: [
        'No-shows reduced by 40% through layered reminders and confirmations',
        'Less manual rescheduling work for reception staff',
        'Better operational visibility through dashboards and filters',
      ],
    ),
  ];

  static CaseStudy? byId(BuildContext context, String id) {
    for (final c in all(context)) {
      if (c.id == id) return c;
    }
    return null;
  }
}
