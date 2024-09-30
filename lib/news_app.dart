import 'package:flutter/material.dart';
import 'package:newsapp/core/routes/app_routes.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
/// Class use to define all starting configurations
class NewsApp extends StatelessWidget {
  /// Class use to define all starting configurations
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      supportedLocales: const [
         Locale('es', ''), 
     
      ],
    debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      );
}
