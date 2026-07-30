import 'package:flutter/widgets.dart';

/// Localization helper for marketing copy that is not part of the
/// generated ARB catalog yet.
extension SiteStrings on BuildContext {
  bool get isEnglish => Localizations.localeOf(this).languageCode == 'en';

  String tr({required String pt, required String en}) => isEnglish ? en : pt;
}
