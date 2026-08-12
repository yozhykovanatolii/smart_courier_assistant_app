import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_event.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/dependencies.dart';
import 'package:smart_courier_assistant_app/exceptions/missing_api_config_exception.dart';
import 'package:smart_courier_assistant_app/localization/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final apiBaseUrl = dotenv.env['API_BASE_URL'];
  if (apiBaseUrl == null) {
    throw MissingApiConfigException('API config is missing');
  }
  Dependencies.setupDependencies(apiBaseUrl);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final appBloc = GetIt.I<AppBloc>();
            appBloc
              ..add(AppUserSubscriptionRequested())
              ..add(AppStarted());
            return appBloc;
          },
        ),
        BlocProvider(
          create: (_) => GetIt.I<SettingsCubit>()..fetchSettings(),
        ),
      ],
      child: const SmartCourierAssistantApp(),
    ),
  );
}

class SmartCourierAssistantApp extends StatelessWidget {
  const SmartCourierAssistantApp({super.key});

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.select(
      (SettingsCubit cubit) => cubit.state.isDarkMode,
    );
    final languageCode = context.select(
      (SettingsCubit cubit) => cubit.state.languageCode,
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: isDarkMode ? AppTheme.darkTheme : AppTheme.lightTheme,
      locale: Locale(languageCode),
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: _appRouter.config(),
    );
  }
}
