import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:newsapp/Core/helper_function/on_generate_routes.dart';
import 'package:newsapp/Core/helper_function/theme_provider.dart';
import 'package:newsapp/Core/services/custom_block_observer.dart';
import 'package:newsapp/Core/services/get_it_service.dart';
import 'package:newsapp/Core/services/shared_preferences_sengleton.dart';
import 'package:newsapp/Core/utils/themas.dart';
import 'package:newsapp/firebase_options.dart';
import 'package:newsapp/generated/l10n.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlockObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prfs.init();
  setupGetit();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const NewsApp(),
  ));
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
      theme: lightmode,
      darkTheme: darkmode,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
    );
  }
}
