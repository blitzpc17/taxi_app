import 'package:flutter/material.dart';
import 'package:taxi_app/config/router/app_route.dart';
import 'package:taxi_app/config/theme/theme_app.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme().getTheme(),
     
    );
  }
}
