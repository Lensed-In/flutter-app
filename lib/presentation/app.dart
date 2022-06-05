import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/localization/app_localizations_delegate.dart';
import 'package:profile/localization/language_code.dart';
import 'package:profile/localization/locale_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:profile/presentation/app/app_bloc_listeners.dart';
import 'package:profile/presentation/app/app_bloc_providers.dart';

import 'app/routes.dart';
import 'journey/launch/splash_screen.dart';
import 'themes/app_themes.dart';
import 'widgets/loader_widget/loader_bloc_widget.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_AppState>();
    state!.setLocale(newLocale);
  }

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final GlobalKey<NavigatorState> _navigatorStateGlobalKey =
      GlobalKey<NavigatorState>();

  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      // LOG.d(locale);
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        builder: (_, child) => buildMaterialApp(child),
        child: const SplashScreen(),
      );

  Widget _materialAppBuilder(BuildContext context, Widget? widget) =>
      MultiBlocProvider(
        providers: getAppStartupBlocProviders(_navigatorStateGlobalKey),
        child: MultiBlocListener(
          listeners: getAppStartupBlocListeners(_navigatorStateGlobalKey),
          child: LoaderBlocWidget(
            navigator: _navigatorStateGlobalKey,
            child: widget ?? Container(),
          ),
        ),
        // child: LoaderBlocWidget(
        //   navigator: _navigatorStateGlobalKey,
        //   child: widget ?? Container(),
        // ),
      );

  MaterialApp buildMaterialApp(Widget? child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorStateGlobalKey,
      builder: _materialAppBuilder,
      title: 'Orb',
      theme: AppTheme.lightTheme(context),
      darkTheme: AppTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      routes: Routes.getAll(),
      // onGenerateRoute: Routes.generateRoute,
      locale: _locale,
      home: child,
      supportedLocales: const [
        Locale(LanguageCode.ENGLISH, ''),
        Locale(LanguageCode.HINDI, ''),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      });
}
