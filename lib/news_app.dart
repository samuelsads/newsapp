import 'package:flutter/material.dart';
import 'package:newsapp/core/routes/app_routes.dart';

/// Class use to define all starting configurations
class NewsApp extends StatelessWidget {
  /// Class use to define all starting configurations
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      );
}
