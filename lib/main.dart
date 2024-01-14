import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ncm/api/auth_api_manager.dart';
import 'package:ncm/api/base/dio_api_manager.dart';
import 'package:ncm/bloc/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:ncm/bloc/internet_connection_bloc/repository/check_connection_using_url.dart';
import 'package:ncm/bloc/internet_connection_bloc/repository/network_info.dart';
import 'package:ncm/bloc/lang/language_cubit.dart';
import 'package:ncm/prefs/pref_manager.dart';
import 'package:ncm/ui/screens/dashboard/dashboard_screen.dart';
import 'package:ncm/ui/screens/home/home_screen.dart';
import 'package:ncm/ui/screens/login/bloc/login_bloc.dart';
import 'package:ncm/ui/screens/login/bloc/login_repo.dart';
import 'package:ncm/ui/screens/login/login_screen.dart';
import 'package:ncm/ui/screens/more/more_screen.dart';
import 'package:ncm/ui/screens/services/services_screen.dart';
import 'package:ncm/ui/screens/settings/settings_screen.dart';
import 'package:ncm/ui/screens/splash/splash_screen.dart';
import 'package:ncm/util/lang/app_localization.dart';
import 'package:ncm/util/theme/app_theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(
            create: (BuildContext context) => LanguageCubit()),
        BlocProvider<InternetConnectionBloc>(
          create: (BuildContext context) => InternetConnectionBloc(
            connectionCheck: NetworkInfoRepository(
              checkConnectionUsingUrl: const CheckConnectionUsingUrl(
                customInterNetAddress: CustomInterNetAddress(),
              ),
              connectivity: Connectivity(),
            ),
          ),
        ),
        BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(
                loginRepository: LoginRepo(
                    authApiManager:
                        AuthApiManager(DioApiManager(PrefManager()))))),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, localeState) {
          return MaterialApp(
              title: 'NCM',
              theme: AppTheme(localeState).themeDataLight,
              debugShowCheckedModeBanner: false,

              /// the list of our supported locals for our app
              /// currently we support only 2 English, Arabic ...
              supportedLocales: const [
                Locale(codeEn, countryUs),
                Locale(codeAr, countryEg)
              ],

              /// these delegates make sure that the localization data for the proper
              /// language is loaded ...
              localizationsDelegates: const [
                /// this for selecting the county localization
                CountryLocalizations.delegate,

                /// A class which loads the translations from JSON files
                AppLocalizations.delegate,

                /// Built-in localization of basic text for Material widgets
                GlobalMaterialLocalizations.delegate,

                /// Built-in localization for text direction LTR/RTL
                GlobalWidgetsLocalizations.delegate,

                GlobalCupertinoLocalizations.delegate,
              ],

              /// Returns a locale which will be used by the app
              localeResolutionCallback: (locale, supportedLocales) {
                /// Check if the current device locale is in our supported locales list
                /// That we added previously --> supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
                if (locale == null) {
                  return supportedLocales.first;
                }
                for (var localItem in supportedLocales) {
                  if (localItem.languageCode == locale.languageCode &&
                      localItem.countryCode == locale.countryCode) {
                    return localItem;
                  }
                }

                /// If the locale of the device is not supported, use the first one
                /// from the list (English, in this case).
                return supportedLocales.first;
              },
              locale: localeState,
              home: const SplashScreen(),
              routes: {
                SplashScreen.routeName: (ctx) => const SplashScreen(),
                LoginScreen.routeName: (ctx) => const LoginScreen(),
                HomeScreen.routeName: (ctx) => const HomeScreen(),
                DashboardScreen.routeName: (ctx) => const DashboardScreen(),
                ServicesScreen.routeName: (ctx) => const ServicesScreen(),
                SettingsScreen.routeName: (ctx) => const SettingsScreen(),
                MoreScreen.routeName: (ctx) => const MoreScreen(),
              });
        },
      ),
    );
  }
}
