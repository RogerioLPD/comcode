import 'package:flutter/material.dart';

/// Controls the app's current locale.
///
/// We keep this local-only (no backend) and persist nothing by default.
class LocaleController extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  bool get isEnglish => _locale?.languageCode == 'en';
  bool get isPortuguese => _locale?.languageCode == 'pt';

  void setLocale(Locale? locale) {
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
  }

  void setEnglish() => setLocale(const Locale('en'));
  void setPortuguese() => setLocale(const Locale('pt'));
  void useSystem() => setLocale(null);
}
