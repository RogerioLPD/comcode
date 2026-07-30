import 'package:flutter/widgets.dart';
import 'package:comcode/core/localization/generated/app_localizations.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
