import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_bloc.dart';
import 'package:smart_courier_assistant_app/bloc/app/app_event.dart';
import 'package:smart_courier_assistant_app/bloc/settings/settings_cubit.dart';
import 'package:smart_courier_assistant_app/core/exceptions/missing_supabase_config_exception.dart';
import 'package:smart_courier_assistant_app/dependencies.dart';
import 'package:smart_courier_assistant_app/firebase_options.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';
import 'package:smart_courier_assistant_app/router/app_router.dart';
import 'package:smart_courier_assistant_app/ui/theme/app_theme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  final supabaseProjectUrl = dotenv.env['SUPABASE_PROJECT_URL'];
  final supabaseProjectKey = dotenv.env['SUPABASE_PROJECT_KEY'];
  if (supabaseProjectUrl == null || supabaseProjectKey == null) {
    throw MissingSupabaseConfigException(
      'Supabase project config is missing',
    );
  }
  await Future.wait([
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    Supabase.initialize(
      url: supabaseProjectUrl,
      publishableKey: supabaseProjectKey,
    ),
  ]);
  Dependencies.setupDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              GetIt.I<AppBloc>()..add(AppUserSubscriptionRequested()),
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
