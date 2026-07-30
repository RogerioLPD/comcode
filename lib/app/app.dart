import 'package:comcode/app/router/app_router.dart';
import 'package:comcode/core/localization/generated/app_localizations.dart';
import 'package:comcode/core/localization/l10n_extension.dart';
import 'package:comcode/core/localization/locale_controller.dart';
import 'package:comcode/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Root widget and composition point for application-wide dependencies.
class ComcodeApp extends StatelessWidget {
  const ComcodeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LocaleController(),
      child: Consumer<LocaleController>(
        builder: (context, localeController, _) {
          return MaterialApp.router(
            onGenerateTitle: (context) => context.l10n.appTitle,
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.system,
            locale: localeController.locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerConfig: AppRouter.router,
          );
        },
      ),
    );
  }
}
