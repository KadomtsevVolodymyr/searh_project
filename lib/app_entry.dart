import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:search_project/core/theme/theme_container.dart';
import 'package:search_project/data/datasource/local/secure_storage.dart';
import 'package:search_project/domain/repository/solution_repository_interface.dart';
import 'package:search_project/generated/l10n.dart';
import 'package:search_project/navigation/app_router.dart';
import 'package:search_project/solution_injection.dart';
import 'package:value_provider/value_provider.dart';

class AppEntry extends StatelessWidget {
  AppEntry({
    required SecureStorage secureStorage,
    super.key,
  }) : _router = AppRouter(storage: secureStorage);

  final AppRouter _router;

  Future<ThemeMode> getThemeMode(BuildContext buildContext) async {
    final themeModeValue =
        Provider.of<ISolutionRepository>(buildContext).getTheme();
    return ThemeMode.values[await themeModeValue ?? 0];
  }

  Future<Locale> getLocale(BuildContext buildContext) async {
    final localeValue =
        Provider.of<ISolutionRepository>(buildContext).getLocale();
    return Locale(await localeValue ?? 'en');
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return MultiProvider(
      providers: SolutionInjection.getDiList(context),
      child: Builder(
        builder: (BuildContext context) {
          return ValueProvider<ThemeMode, ThemeMode>(
            shouldNotify: (newMode, oldMode) => newMode.index != oldMode.index,
            future: getThemeMode(context),
            initValue: ThemeMode.system,
            builder: (_, themeMode) {
              return ValueProvider<Locale, Locale>(
                shouldNotify: (newMode, oldMode) =>
                    newMode.languageCode != oldMode.languageCode,
                future: getLocale(context),
                initValue: const Locale('en', 'US'),
                builder: (context, locale) {
                  return MaterialApp.router(
                    title: 'Silverstone',
                    theme: ThemeFactory.lightTheme.themeData,
                    darkTheme: ThemeFactory.darkTheme.themeData,
                    themeMode: themeMode,
                    routerDelegate: _router.delegate(),
                    routeInformationParser: _router.defaultRouteParser(),
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: locale,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
