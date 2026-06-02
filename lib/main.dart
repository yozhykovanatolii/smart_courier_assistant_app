import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_courier_assistant_app/dependencies.dart';
import 'package:smart_courier_assistant_app/feature/splash/splash.dart';
import 'package:smart_courier_assistant_app/firebase_options.dart';
import 'package:smart_courier_assistant_app/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Dependencies.setupDependencies();
  runApp(const SmartCourierAssistantApp());
}

class SmartCourierAssistantApp extends StatelessWidget {
  const SmartCourierAssistantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: const SplashPage(),
    );
  }
}
