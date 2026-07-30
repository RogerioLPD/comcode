import 'package:flutter/material.dart';

/// Business representation of a case study.
///
/// It stays independent from routing and presentation so a future API or CMS
/// can replace the local data source without changing the UI.
class CaseStudy {
  final String id;
  final String title;
  final String subtitle;
  final String metric;
  final IconData icon;
  final Color accent;
  final String industry;
  final String clientProfile;
  final String challenge;
  final List<String> deliveries;
  final List<String> stack;
  final List<String> results;
  final String? testimonial;

  const CaseStudy({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.metric,
    required this.icon,
    required this.accent,
    required this.industry,
    required this.clientProfile,
    required this.challenge,
    required this.deliveries,
    required this.stack,
    required this.results,
    this.testimonial,
  });
}
