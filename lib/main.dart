import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/Core/helper_function/on_generate_routes.dart';
import 'package:newsapp/Core/services/custom_block_observer.dart';
import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/utils/app_colors.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlockObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prfs.init();
  setupGetit();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
    );
  }
}
