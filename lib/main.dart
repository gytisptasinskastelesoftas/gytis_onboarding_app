import 'package:flutter/material.dart';
import 'package:gytis_onboarding_app/app/app_routes.dart';
import 'package:gytis_onboarding_app/home/home_component.dart';
import 'package:gytis_onboarding_app/tutorial/tutorial_component.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
    );
  }
}
