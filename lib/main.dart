

import 'package:flutter/material.dart';
import 'package:newsapp/core/routes/app_routes.dart';

void main() => runApp(const MyApp());
/// Class use to define all starting configurations
class MyApp extends StatelessWidget {
  /// Class use to define all starting configurations
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routerConfig: appRouter,
    );
}